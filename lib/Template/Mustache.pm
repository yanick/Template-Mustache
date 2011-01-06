# Template::Mustache is an implementation of the fabulous Mustache templating
# language for Perl 5.8 and later.
#
# Information about the design and syntax of Mustache can be found
# [here](http://mustache.github.com).
package Template::Mustache;
use strict;
use warnings;

use CGI ();
use File::Spec;

# Constructs a new regular expression, to be used in the parsing of Mustache
# templates.
# @param [String] $otag The tag opening delimiter.
# @param [String] $ctag The tag closing delimiter.
# @return [Regex] A regular expression that will match tags with the specified
#   delimiters.
# @api private
sub build_pattern {
    my ($otag, $ctag) = @_;
    return qr/
        (.*?)                       # Capture the pre-tag content
        ([ \t]*)                    # Capture the pre-tag whitespace
        (?:\Q$otag\E \s*)           # Match the opening of the tag
        (?:
            (=)   \s* (.+?) \s* = | # Capture Set Delimiters
            ({)   \s* (.+?) \s* } | # Capture Triple Mustaches
            (\W?) \s* (.+?)         # Capture everything else
        )
        (?:\s* \Q$ctag\E)           # Match the closing of the tag
    /xsm;
}

# Reads a file into a string, returning the empty string if the file does not
# exist.
# @param [String] $filename The name of the file to read.
# @return [String] The contents of the given filename, or the empty string.
# @api private
sub read_file {
    my ($filename) = @_;
    return '' unless -f $filename;

    local *FILE;
    open FILE, $filename or die "Cannot read from file $filename!";
    sysread(FILE, my $data, -s FILE);
    close FILE;

    return $data;
}

# @overload parse($tmpl)
#   Creates an AST from the given template.
#   @param [String] $tmpl The template to parse.
#   @return [Array] The AST represented by the given template.
#   @api private
# @overload parse($tmpl, $delims)
#   Creates an AST from the given template, with non-standard delimiters.
#   @param [String] $tmpl The template to parse.
#   @param [Array<String>[2]] $delims The delimiter pair to begin parsing with.
#   @return [Array] The AST represented by the given template.
#   @api private
# @overload parse($tmpl, $delims, $section, $start)
#   Parses out a section tag from the given template.
#   @param [String] $tmpl The template to parse.
#   @param [Array<String>[2]] $delims The delimiter pair to begin parsing with.
#   @param [String] $section The name of the section we're parsing.
#   @param [Int] $start The index of the first character of the section.
#   @return [(String, Int)] The raw text of the section, and the index of the
#       character immediately following the close section tag.
#   @api internal
sub parse {
    my ($tmpl, $delims, $section, $start) = @_;
    my @buffer;

    # Build the pattern, and instruct the regex engine to begin at `$start`.
    my $pattern = build_pattern(@{$delims ||= [qw'{{ }}']});
    my $pos = pos($tmpl) = $start ||= 0;

    # Begin parsing out tags
    while ($tmpl =~ m/\G$pattern/gc) {
        my ($content, $whitespace) = ($1, $2);
        my $type = $3 || $5 || $7;
        my $tag  = $4 || $6 || $8;

        # Buffer any non-tag content we have.
        push @buffer, $content if $content;

        # Grab the index for the end of the content, and update our pointer.
        my $eoc = $pos + length($content) - 1;
        $pos = pos($tmpl);

        # A tag is considered standalone if it is the only non-whitespace
        # content on a line.
        my $is_standalone = (substr($tmpl, $eoc, 1) || "\n") eq "\n" &&
                            (substr($tmpl, $pos, 1) || "\n") eq "\n";

        # Standalone tags should consume the newline that follows them, unless
        # the tag is of an interpolation type.
        # Otherwise, any whitespace we've captured should be added to the
        # buffer, and the end of content index should be advanced.
        if ($is_standalone && ($type ne '{' && $type ne '&' && $type ne '')) {
            $pos += 1;
        } elsif ($whitespace) {
            $eoc += length($whitespace);
            push @buffer, $whitespace;
            $whitespace = '';
        }

        if ($type eq '!') {
            # Comment Tag - No-op.
        } elsif ($type eq '{' || $type eq '&' || $type eq '') {
            # Interpolation Tag - Buffers the tag type and name.
            push @buffer, [ $type, $tag ];
        } elsif ($type eq '>') {
            # Partial Tag - Buffers the tag type, name, and any indentation
            push @buffer, [ $type, $tag, $whitespace ];
        } elsif ($type eq '=') {
            # Set Delimiter Tag - Changes the delimiter pair and updates the
            # tag pattern.
            $pattern = build_pattern(@{$delims = [ split(/\s+/, $tag) ]});
        } elsif ($type eq '#' || $type eq '^') {
            # Section Tag - Recursively calls #parse (starting from the current
            # index), and receives the raw section string and a new index.
            # Buffers the tag type, name, the section string and delimiters.
            (my $raw, $pos) = parse($tmpl, $delims, $tag, $pos);
            push @buffer, [ $type, $tag, [$raw, $delims] ];
        } elsif ($type eq '/') {
            # End Section Tag - Short circuits a recursive call to #parse,
            # returning the raw section template and the index immediately
            # following this tag.
            return (substr($tmpl, $start, $eoc + 1 - $start), $pos);
        }

        # Update our match pointer to coincide with any changes we've made.
        pos($tmpl) = $pos
    }

    # Buffer any remaining template, and return a reference to the buffer.
    push @buffer, substr($tmpl, $pos);
    return \@buffer;
}

# Produces an expanded version of the template represented by the given parse
# tree.
# @param [Array<String,Array>] $parse_tree The AST of a Mustache template.
# @param [Code] $partials A subroutine that looks up partials by name.
# @param [(Any)] @context The context stack to perform key lookups against.
# @return [String] The fully rendered template.
# @api private
sub generate {
    my ($parse_tree, $partials, @context) = @_;

    # Build a helper function to abstract away subtemplate expansion.
    # Recursively calls generate after parsing the given template.  This allows
    # us to use the call stack as our context stack.
    my $build = sub { generate(parse(@_[0,1]), $partials, $_[2], @context) };

    # Walk through the parse tree, handling each element in turn.
    join '', map {
        # If the given element is a string, treat it literally.
        my @result = ref $_ ? () : $_;

        # Otherwise, it's a three element array, containing a tag's type, name,
        # and accessory data.  As a precautionary step, we can prefetch any
        # data value from the context stack (which will be useful in every case
        # except partial tags).
        unless (@result) {
            my ($type, $tag, $data) = @$_;
            my ($ctx, $value) = lookup($tag, @context) unless $type eq '>';

            if ($type eq '{' || $type eq '&' || $type eq '') {
                # Interpolation Tags
                # If the value is a code reference, we should treat it
                # according to Mustache's lambda rules.  Specifically, we
                # should call the sub, render its contents against the current
                # context, and cache the value (if possible).
                if (ref $value eq 'CODE') {
                    $value = $build->($value->());
                    $ctx->{$tag} = $value if ref $ctx eq 'HASH';
                }
                # An empty `$type` represents an HTML escaped tag.
                $value = CGI::escapeHTML($value) unless $type;
                @result = $value;
            } elsif ($type eq '#') {
                # Section Tags
                # `$data` will contain an array reference with the raw template
                # string, and the delimiter pair being used when the section
                # tag was encountered.
                # There are four special cases for section tags.
                #  * If the value is falsey, the section is skipped over.
                #  * If the value is an array reference, the section is
                #    rendered once using each element of the array.
                #  * If the value is a code reference, the raw section string
                #    is passed to the sub to be filtered before rendering.
                #  * Otherwise, the section is rendered using given value.
                if (ref $value eq 'ARRAY') {
                    @result = map { $build->(@$data, $_) } @$value;
                } elsif ($value) {
                    $data->[0] = $value->($data->[0]) if ref $value eq 'CODE';
                    @result = $build->(@$data, $value);
                }
            } elsif ($type eq '^') {
                # Inverse Section Tags
                # These should only be rendered if the value is falsey or an
                # empty array reference.  `$data` is as for Section Tags.
                $value = @$value if ref $value eq 'ARRAY';
                @result = $build->(@$data) unless $value;
            } elsif ($type eq '>') {
                # Partial Tags
                # `$data` contains indentation to be applied to the partial.
                # The partial template is looked up thanks to the `$partials`
                # code reference, rendered, and non-empty lines are indented.
                @result = $build->(scalar $partials->($tag));
                $result[0] =~ s/^(?=.)/${data}/gm if $data;
            }
        }
        @result; # Collect the results...
    } @$parse_tree;
}

# Performs a lookup of a `$field` in a context stack.
# @param [String] $field The field to lookup.
# @param [(Any)] @context The context stack.
# @return [(Any, Any)] The context element and value for the given `$field`.
# @api private
sub lookup {
    my ($field, @context) = @_;
    my ($value, $ctx) = '';

    for my $index (0..$#{[@context]}) {
        $ctx = $context[$index];
        if (ref $ctx eq 'HASH') {
            next unless exists $ctx->{$field};
            $value = $ctx->{$field};
            last;
        } else {
            next unless UNIVERSAL::can($ctx, $field);
            $value = $ctx->$field();
            last;
        }
    }

    return ($ctx, $value);
}

# @constructor
# @param %args Initialization data.
sub new {
    my ($class, %args) = @_;
    return bless({ %args }, $class);
}

our $template_path = '.';
sub template_path { $template_path }

our $template_extension = 'mustache';
sub template_extension { $template_extension }

our $template_file;
sub template_file { $template_file }

# Reads the template off disk.
# @return [String] The contents of the template file, which is the module file
#   path appended to {#template_path}, with a type of {#template_extension}.
sub template {
    my ($receiver) = @_;
    my $path = $receiver->template_path();
    my $template_file = $receiver->template_file();

    unless ($template_file) {
        my $class = ref $receiver || $receiver;
        my $ext  = $receiver->template_extension();
        $template_file = File::Spec->catfile(split(/::/, "${class}.${ext}"));
    }
    return read_file(File::Spec->catfile($path, $template_file));
}

# Reads a named partial off disk.
# @param [String] $name The name of the partial to lookup.
# @return [String] The contents of the partial (in {#template_path}, of type
#   {#template_extension}), or the empty string, if the partial does not exist.
sub partial {
    my ($receiver, $name) = @_;
    my $path = $receiver->template_path();
    my $ext  = $receiver->template_extension();
    return read_file(File::Spec->catfile($path, "${name}.${ext}"));
}

# Renders a template with the given data.
#
# @param [String] $tmpl The template to render.
# @param [Hash,Class,Object] $data Data to interpolated into the template.
# @param [Hash,Class,Object,Code] $partials A context element to fetch partials
#   from, or a code reference that will return the appropriate partial given a
#   partial name.
# @return [String] The fully rendered template.
sub render {
    my ($receiver, $tmpl, $data, $partials) = @_;

    ($data, $tmpl) = ($tmpl, $data) if !(ref $data) && (ref $tmpl);

    $tmpl       = $receiver->template() unless defined $tmpl;
    $data     ||= $receiver;
    $partials ||= sub {
        unshift @_, $receiver;
        goto &{$receiver->can('partial')};
    };

    my $part = $partials;
    $part = sub { lookup(shift, $partials) } unless ref $partials eq 'CODE';

    my $parsed = parse($tmpl);
    return generate($parsed, $part, $data);
}

1;

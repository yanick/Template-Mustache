# Template::Mustache is an implementation of the fabulous Mustache templating
# language for Perl 5.8 and later.
#
# Information about the design and syntax of Mustache can be found
# [here](http://mustache.github.com).
package Template::Mustache;
use strict;
use warnings;

use CGI ();

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

sub generate {
    my ($parse_tree, $partials, @context) = @_;

    my $build = sub {
        my $value = pop(@_);
        return generate(parse(@_), $partials, @context, $value);
    };

    my @parts;
    for my $part (@$parse_tree) {
        push(@parts, $part) and next unless ref $part;
        my ($type, $tag, $data) = @$part;
        my ($ctx, $value) = lookup($tag, @context);

        if ($type eq '{' || $type eq '&' || $type eq '') {
            if (ref $value eq 'CODE') {
                $value = $build->($value->(), undef);
                $ctx->{$tag} = $value;
            }
            $value = CGI::escapeHTML($value) unless $type;
            push @parts, $value;
        } elsif ($type eq '#') {
            next unless $value;
            if (ref $value eq 'ARRAY') {
                push @parts, $build->(@$data, $_) for @$value;
            } elsif (ref $value eq 'CODE') {
                push @parts, $build->($value->($data->[0]), $data->[1], undef);
            } else {
                push @parts, $build->(@$data, $value);
            }
        } elsif ($type eq '^') {
            next if ref $value eq 'ARRAY' ? @$value : $value;
            push @parts, $build->(@$data, undef);
        } elsif ($type eq '>') {
            my $partial = $partials->($tag);
            $partial =~ s/^(.)/${data}${1}/gm;
            push @parts, $build->($partial, undef);
        }
    }

    return join '', @parts;
}

sub lookup {
    my ($field, @context) = @_;
    my $ctx;
    my $value = '';

    for my $index (reverse 0..$#{[@context]}) {
        $ctx = $context[$index];
        if (ref $ctx eq 'HASH') {
            next unless exists $ctx->{$field};
            $value = $ctx->{$field};
            last;
        } else {
            next unless UNIVERSAL::can($ctx, $field);
            $value = UNIVERSAL::can($ctx, $field)->();
            last;
        }
    }

    return ($ctx, $value);
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

    my $part = $partials;
    $part = sub { lookup(shift, $partials) } unless ref $partials eq 'CODE';

    my $parsed = parse($tmpl);
    return generate($parsed, $part, $data);
}

1;

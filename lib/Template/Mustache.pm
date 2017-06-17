package Template::Mustache;
# ABSTRACT: Drawing Mustaches on Perl for fun and profit

use Moo;
use MooseX::MungeHas { has_rw => [ 'is_rw' ] };

use Text::Balanced qw/ extract_tagged gen_extract_tagged extract_multiple /;

use Template::Mustache::Token::Template;
use Template::Mustache::Token::Variable;
use Template::Mustache::Token::Verbatim;
use Template::Mustache::Token::Section;
use Template::Mustache::Token::Partial;

use Parse::RecDescent;
use List::AllUtils qw/ pairmap /;

has_rw template => (
    trigger => sub { $_[0]->_clear_compiled_template },
);

has_rw _compiled_template => (
    clearer => 1,
    lazy => 1, 
    default => sub {
        $_[0]->_compile_template( $_[0]->template );
    });

has_rw delimiters => sub { [ '{{', '}}' ] };

has_rw _partials => sub { +{} };

has_rw parser => sub {
    my $self = shift;
    use Template::Mustache::Parser;
    return Template::Mustache::Parser->new;
    #Parse::RecDescent->new( $self->grammar )
};

sub partials {
    my( $self, $partials ) = @_;
    while( my ( $name, $template ) = each %$partials ) {
        $self->add_partial( $name, $template );
    }
}

sub add_partial {
    my( $self, $name, $template ) = @_;
    $self->_partials->{$name} = $self->compile( $template );
}
    
sub render {  
    my $self = shift;

    $self = $self->new unless ref $self;

    my( $template, $context, $partials ) = @_;

    $self->template( $template );
    $self->partials( $partials ) if $partials;

    $self->_compiled_template->([ $context ], $self->_partials);
}


sub compile {
    my( $self, $template ) = @_;

    use Template::Mustache::Parser;
    my $parser = Parse::RecDescent->new($self->grammar);
#my    $parser = Template::Mustache::Parser->new;

    return $parser->template( $template, undef, @{ $self->delimiters } );
}


sub _compile_template {  
    my( $self, $template, $pre ) = @_;

    my $tree = $self->compile($template);

    return sub {
        $tree->render(@_)
    };
}

sub resolve_context {  
    my ( $key, $context ) = @_;

    no warnings 'uninitialized';
    return $context->[0] if $key eq '.' or $key eq '';

    my $first;
    ( $first, $key ) = split '\.', $key, 2;

    CONTEXT:
    for my $c ( @$context ) {
        if ( ref $c eq 'HASH' ) {
            next CONTEXT unless exists $c->{$first};
            return resolve_context($key,[$c->{$first}]);
        }
    }

    return;
}

sub grammar { 

#    $::RD_TRACE = 2;

    return <<'END_GRAMMAR';

<skip:qr//> 

{ my ( $prev_is_standalone, $first_item ) = ( 1, 1); } 

eofile: /^\Z/

template: <rulevar: local $otag>

template: <rulevar: local $ctag> 

template: { ($otag,$ctag) = @arg ? @arg : ( qw/ {{ }} / );
    $thisparser->{opening_tag} = $otag;
    $thisparser->{closing_tag} = $ctag;
    1;
} template_item(s?) eofile {
    Template::Mustache::Token::Template->new(
        items => $item[2]
    );
} | <error>

opening_tag: "$thisparser->{opening_tag}"

closing_tag: "$thisparser->{closing_tag}"

template_item:  ( partial | section | delimiter_change | comment | unescaped_variable_amp | unescaped_variable | variable | verbatim | <error>) {
    $item[1]
}

delimiter_change: standalone_surround[$item[0]] {
    ( $otag, $ctag ) = split /\s+/, $item[1][2];

    ( $thisparser->{opening_tag},
        $thisparser->{closing_tag} ) = (  $otag, $ctag );
    Template::Mustache::Token::Verbatim->new( content =>
        $item[1][0] . $item[1][1]
    );
}

delimiter_change_inner: '=' /\s*/ /.*?(?=\=\Q$ctag\E)/s '=' {
    $item[3]
}

partial: /\s*/ "$otag" '>' /\s*/ /[\w.]+/ /\s*/ "$ctag" /\s*/ { 
    my $prev = $prev_is_standalone;
    $prev_is_standalone = 0;
    my $indent = '';
    if ( $item[1] =~ /\n/ or $prev ) {
        if ( $item[8] =~ /\n/  or length $text == 0) {
            $item[1] =~ /(^|\n)([ \t]*?)$/;
            $indent = $2;
            $item[8] =~ s/^.*?\n//;
            $prev_is_standalone = 1;
        }
    }
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Partial->new( name => $item[5],
                indent => $indent ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] ),
        ],
        )
}

open_section: /\s*/ opening_tag /[#^]/ /\s*/ /[\w.]+/ /\s*/ closing_tag /\s*/ { 
    my $prev = $prev_is_standalone;
    $prev_is_standalone = 0;
    if ( $item[1] =~ /\n/ or $prev ) {
        if ( $item[8] =~ /\n/ ) {
            $item[1] =~ s/(^|\n)[ \t]*?$/$1/;
            $item[8] =~ s/^.*?\n//;
            $prev_is_standalone = 1;
        }
    }

    [ $item[5], $item[3] eq '^',
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] )
    ];
}

close_section: /\s*/ "$otag" '/' /\s*/ "$arg[0]" /\s*/ "$ctag" /\s*/ {
    my $prev = $prev_is_standalone;
    $prev_is_standalone = 0;
    if ( $item[1] =~ /\n/ or $prev) {
        if ( $item[8] =~ /\n/ or length $text == 0 ) {
            $item[1] =~ s/(^|\n)[ \t]*?$/$1/;
            $item[8] =~ s/^.*?\n//;
            $prev_is_standalone = 1;
        }
    }
    [
        Template::Mustache::Token::Verbatim->new( content => $item[1] ),
        Template::Mustache::Token::Verbatim->new( content => $item[8] ),
    ]
}

standalone_surround: /\s*/ "$otag" /\s*/ <matchrule:$arg[0]_inner> "$ctag" /\s*/ {
    my $prev = $prev_is_standalone;
    $prev_is_standalone = 0;

    if ( $item[1] =~ /\n/ or $prev) {
        if ( $item[6] =~ /\n/  or length $text == 0) {
            $item[1] =~ s/(\r?\n?)\s*?$/$1/;
            $item[6] =~ s/^.*?\n//;
            $prev_is_standalone = 1;
        }
    }

    [  @item[1,6,4] ],
}

comment: standalone_surround[$item[0]] { 
    Template::Mustache::Token::Verbatim->new( 
        content => $item[1][0] . $item[1][1]
    ),
}

comment_inner: '!' /.*?(?=\Q$ctag\E)/s

inner_section: ...!close_section[ $arg[0] ] template_item 

section: open_section {$thisoffset} inner_section[ $item[1][0] ](s?) {$thisoffset
    - $item[2]
} close_section[ $item[1][0] ] {
    my $raw = substr( $thisparser->{fulltext}, $item[2], $item[4] );
    Template::Mustache::Token::Template->new( items => [
        $item[1]->[2],
        Template::Mustache::Token::Section->new(
            delimiters => [ $otag, $ctag ],
            variable => $item[1][0],
            inverse => $item[1][1],
            raw => $raw,
            template => Template::Mustache::Token::Template->new( 
                items => [ 
                    $item[1][3], @{$item[3]}, $item[5][0] ], 
            )
        ),
        $item[5][1]
        ]
    );
}

unescaped_variable: /\s*/ opening_tag '{' /\s*/ variable_name /\s*/ '}' closing_tag {
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( 
                name => $item{variable_name},
                escape => 0,
            ),
        ]
    );
}

unescaped_variable_amp: /\s*/ opening_tag '&' /\s*/ variable_name /\s*/ closing_tag {
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( 
                name => $item{variable_name},
                escape => 0,
            ),
        ]
    );
}


variable: /\s*/ opening_tag /\s*/ variable_name /\s*/ closing_tag {
    $prev_is_standalone = 0;
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( name => $item{variable_name} ),
        ]
    );
}

variable_name: /[\w.]+/

verbatim: /^\s*\S*?(?=\Q$otag\E|\s|$)/ {
    $prev_is_standalone = 0;
    Template::Mustache::Token::Verbatim->new( content => $item[1] );
}

END_GRAMMAR
}

1;

__END__

use strict;
use warnings;

=head1 SYNOPSIS

    use Template::Mustache;

    print Template::Mustache->render(
        "Hello {{planet}}", {planet => "World!"}), "\n";

=head1 DESCRIPTION

Template::Mustache is an implementation of the fabulous L<Mustache|https://mustache.github.io/> templating
language for Perl.

=head1 SEE ALSO

=over

=item L<https://mustache.github.io>

The main, pan-language site for I<Mustache>.

=item L<https://mustache.github.io/mustache.5.html>

Specs of the I<Mustache> DSL.

=item L<Text::Handlebars|https://metacpan.org/pod/Text::Handlebars>

I<Handlebars> is another templating language heavily inspired and very similar to I<Mustache>. L<Text::Handlebars>
is an implementation of it using L<Text::Xslate>.

=back


=cut

use HTML::Entities;
use File::Spec;
use Scalar::Util 'blessed';

my %TemplateCache;

=head2 Functions

=over 4

=item build_pattern($otag, $ctag)

Constructs a new regular expression, to be used in the parsing of Mustache
templates.

=over 4

=item $otag

The tag opening delimiter.

=item $ctag

The tag closing delimiter.

=back

Returns a regular expression that will match tags with the specified
delimiters.

=cut

sub build_pattern {
    my ($otag, $ctag) = @_;
    return qr/
        (?<pretag_content>.*?)                  # Capture the pre-tag content
        (?<pretag_whitespace>[ \t]*)            # Capture the pre-tag whitespace
        (?<opening_tag>\Q$otag\E \s*)           # Match the opening of the tag
        (?:
            (?<type>=)   \s* (?<tag>.+?) \s* = | # Capture Set Delimiters
            (?<type>{)   \s* (?<tag>.+?) \s* } | # Capture Triple Mustaches
            (?<type>\W?) \s* (?<tag>.*?)         # Capture everything else
        )
        (?<closing_tag>\s* \Q$ctag\E)           # Match the closing of the tag
    /xsm;
}

=item read_file($filename)

Reads a file into a string, returning the empty string if the file does not
exist.

=over 4

=item $filename

The name of the file to read.

=back

Returns the contents of the given filename, or the empty string.

=cut

sub read_file {
    my ($filename) = @_;
    return '' unless -f $filename;

    open my $fh, "<", $filename or die "Cannot read from file $filename!";
    sysread($fh, my $data, -s $fh);
    close $fh;

    return $data;
}

=item parse($tmpl, [$delims, [$section, $start]])

Can be called in one of three forms:

=over 4

=item parse($tmpl)

Creates an AST from the given template.

=over 4

=item $tmpl

The template to parse.

=back

An array reference to the AST represented by the given template.

=item parse($tmpl, $delims)

Creates an AST from the given template, with non-standard delimiters.

=over 4

=item $tmpl

The template to parse.

=item $delims

An array reference to the delimiter pair with which to begin parsing.

=back

Returns an array reference to the AST represented by the given template.

=item parse($tmpl, $delims, $section, $start)

Parses out a section tag from the given template.

=over 4

=item $tmpl

The template to parse.

=item $delims

An array reference to the delimiter pair with which to begin parsing.

=item $section

The name of the section we're parsing.

=item $start

The index of the first character of the section.

=back

Returns an array reference to the raw text of the section (first element),
and the index of the character immediately following the close section tag
(last element).

=back

=cut

sub parse {
    my ($tmpl, $delims, $section, $start) = @_;
    my @buffer;

    $tmpl =~ s/\r(?=\n)//g;  # change \r\n to \n

    # Pull the parse tree out of the cache, if we can...
    $delims ||= [qw'{{ }}'];
    my $cache = $TemplateCache{join ' ', @$delims} ||= {};
    return $cache->{$tmpl} if exists $cache->{$tmpl};

    my $error = sub {
        my ($message, $errorPos) = @_;
        my $lineCount = substr($tmpl, 0, $errorPos) =~ tr/\n/\n/;

        die $message . "\nLine " . $lineCount
    };

    # Build the pattern, and instruct the regex engine to begin at `$start`.
    my $pattern = build_pattern(@$delims);
    my $pos = pos($tmpl) = $start ||= 0;

    # Begin parsing out tags
    while ($tmpl =~ m/\G$pattern/gc) {
        my ($content, $whitespace, $type, $tag) = @+{qw/ pretag_content pretag_whitespace type tag /};

        if( $type eq '.' and $tag eq '' ) {
            ($tag,$type) = ($type, $tag );
        }

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
            $delims = [ split(/\s+/, $tag) ];

            $error->("Set Delimiters tags must have exactly two values!", $pos)
                if @$delims != 2;

            $pattern = build_pattern(@$delims);
        } elsif ($type eq '#' || $type eq '^') {
            # Section Tag - Recursively calls #parse (starting from the current
            # index), and receives the raw section string and a new index.
            # Buffers the tag type, name, the section string and delimiters.
            (my $raw, $pos) = parse($tmpl, $delims, $tag, $pos);
            push @buffer, [ $type, $tag, [$raw, $delims] ];
        } elsif ($type eq '/') {
            # End Section Tag - Short circuits a recursive call to #parse,
            # caches the buffer for the raw section template, and returns the
            # raw section template and the index immediately following the tag.
            my $msg;
            if (!$section) {
                $msg = "End Section tag '$tag' found, but not in a section!";
            } elsif ($tag ne $section) {
                $msg = "End Section tag closes '$tag'; expected '$section'!";
            }
            $error->($msg, $pos) if $msg;

            my $raw_section = substr($tmpl, $start, $eoc + 1 - $start);
            $cache->{$raw_section} = [@buffer];
            return ($raw_section, $pos);
        } else {
            $error->("Unknown tag type -- $type", $pos);
        }

        # Update our match pointer to coincide with any changes we've made.
        pos($tmpl) = $pos
    }

    # Buffer any remaining template, cache the template for later, and return
    # a reference to the buffer.
    push @buffer, substr($tmpl, $pos);
    $cache->{$tmpl} = [@buffer];
    return \@buffer;
}

=item generate($parse_tree, $partials, @context)

Produces an expanded version of the template represented by the given parse
tree.

=over 4

=item $parse_tree

The AST of a Mustache template.

=item $partials

A subroutine that looks up partials by name.

=item @context

The context stack to perform key lookups against.

=back

Returns the fully rendered template as a string.

=cut

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
            my $render = sub { $build->(shift, $data->[1]) };

            my ($ctx, $value) = lookup($tag, @context) unless $type eq '>';

            if ($type eq '{' || $type eq '&' || $type eq '') {
                $DB::single = 1;
                # Interpolation Tags
                # If the value is a code reference, we should treat it
                # according to Mustache's lambda rules.  Specifically, we
                # should call the sub (passing a "render" function as a
                # convenience), render its contents against the current
                # context, and cache the value (if possible).
                if (ref $value eq 'CODE') {
                    $value = $build->($value->($render));
                    $ctx->{$tag} = $value if ref $ctx eq 'HASH';
                }
                # An empty `$type` represents an HTML escaped tag.
                $value = encode_entities($value) unless $type;
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
                #    and a rendering function are passed to the sub; the return
                #    value is then automatically rendered.
                #  * Otherwise, the section is rendered using given value.
                $DB::single = 1;
                
                if (ref $value eq 'ARRAY') {
                    @result = map { $build->(@$data, $_) } @$value;
                } elsif ($value) {
                    my @x = @$data;
                    $x[0] = $value->($x[0], $render) if ref $value eq 'CODE';
                    @result = $build->(@x, $value);
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
                my $partial = scalar $partials->($tag);
                $partial =~ s/^(?=.)/${data}/gm if $data;
                @result = $build->($partial);
            }
        }
        @result; # Collect the results...
    } @$parse_tree;
}

=item lookup($field, @context)

Performs a lookup of a C<$field> in a context stack.

=over 4

=item $field

The field to look up.

=item @context

The context stack.

=back

Returns the context element and value for the given C<$field>.

=back

=cut


sub _can_run_field {
    my ($ctx, $field) = @_;

    my $can_run_field;
    if ( $] < 5.018 ) {
        eval { $ctx->can($field) };
        $can_run_field = not $@;
    }
    else {
        $can_run_field = $ctx->can($field);
    }

    return $can_run_field;
}

use namespace::clean;

sub lookup {
    my ($field, @context) = @_;
    my ($value, $ctx) = '';

    for my $index (0..$#{[@context]}) {
        $ctx = $context[$index];
        my $blessed_or_not_ref = blessed($ctx) || !ref $ctx;

        if($field =~ /\./) {
            if ( $field eq '.' ) {
                return ($ctx,$ctx);
            }

            # Dotted syntax foo.bar
            my ($var, $field) = $field =~ /(.+?)\.(.+)/;

            if(ref $ctx eq 'HASH') {
                next unless exists $ctx->{$var};
                ($ctx, $value) = lookup($field, $ctx->{$var});
                last;
            } elsif(ref $ctx eq 'ARRAY') {
                next unless @$ctx[$var];
                ($ctx, $value) = lookup($field, @$ctx[$var]);
                last;
            }
        } elsif (ref $ctx eq 'HASH') {
		    next unless exists $ctx->{$field};
            $value = $ctx->{$field};
            last;
        } elsif (ref $ctx eq 'ARRAY') {
            next unless @$ctx[$field];
            $value = @$ctx[$field];
            last;
        }
        elsif ($ctx && $blessed_or_not_ref && _can_run_field($ctx, $field)) {
            # We want to accept class names and objects, but not unblessed refs
            # or undef. -- rjbs, 2015-06-12
            $value = $ctx->$field();
            last;
        }
    }

    return ($ctx, $value);
}

=head2 Methods

=over 4

=item new(%args)

Standard hash constructor.

=over 4

=item %args

Initialization data.

=back

Returns A new C<Template::Mustache> instance.

=cut

sub new {
    my ($class, %args) = @_;
    return bless({ %args }, $class);
}

our $template_path = '.';

=item template_path

Filesystem path for template and partial lookups.

Returns a string containing the template path (defaults to '.').

=cut

sub template_path { $Template::Mustache::template_path }

our $template_extension = 'mustache';

=item template_extension

File extension for templates and partials.

Returns the file extension as a string (defaults to 'mustache').

=cut

sub template_extension { $Template::Mustache::template_extension }

=item template_namespace

Package namespace to ignore during template lookups.

As an example, if you subclass C<Template::Mustache> as the class
C<My::Heavily::Namepaced::Views::SomeView>, calls to C<render> will
automatically try to load the template
C<./My/Heavily/Namespaced/Views/SomeView.mustache> under the
C<template_path>.  Since views will very frequently all live in a common
namespace, you can override this method in your subclass, and save yourself
some headaches.

   Setting template_namespace to:      yields template name:
     My::Heavily::Namespaced::Views => SomeView.mustache
     My::Heavily::Namespaced        => Views/SomeView.mustache
     Heavily::Namespaced            => My/Heavily/Namespaced/Views/SomeView.mustache

As noted by the last example, namespaces will only be removed from the
beginning of the package name.

Returns the empty string.

=cut

sub template_namespace { '' }

our $template_file;

=item template_file

The template filename to read.  The filename follows standard Perl module
lookup practices (e.g. C<My::Module> becomes C<My/Module.pm>) with the
following differences:

=over 4

=item *

Templates have the extension given by C<template_extension> ('mustache' by
default).

=item *

Templates will have C<template_namespace> removed, if it appears at the
beginning of the package name.

=item *

Template filename resolution will short circuit if
C<$Template::Mustache::template_file> is set.

=item *

Template filename resolution may be overriden in subclasses.

=item *

Template files will be resolved against C<template_path>, not C<$PERL5LIB>.

=back

Returns The path to the template file, relative to C<template_path> as a
string.  See L<template>.

=cut

sub template_file {
    my ($receiver) = @_;
    return $Template::Mustache::template_file
        if $Template::Mustache::template_file;

    my $class = ref $receiver || $receiver;
    $class =~ s/^@{[$receiver->template_namespace()]}:://;
    my $ext  = $receiver->template_extension();
    return File::Spec->catfile(split(/::/, "${class}.${ext}"));
};

=item template

Reads the template off disk.

Returns the contents of the C<template_file> under C<template_path>.

=cut

sub template {
    my ($receiver) = @_;
    my $path = $receiver->template_path();
    my $template_file = $receiver->template_file();
    return read_file(File::Spec->catfile($path, $template_file));
}

=item partial($name)

Reads a named partial off disk.

=over 4

=item $name

The name of the partial to lookup.

=back

Returns the contents of the partial (in C<template_path> of type
C<template_extension>), or the empty string, if the partial does not exist.

=cut

sub partial {
    my ($receiver, $name) = @_;
    my $path = $receiver->template_path();
    my $ext  = $receiver->template_extension();
    return read_file(File::Spec->catfile($path, "${name}.${ext}"));
}

=item render

Render a class or instances data, in each case returning the fully rendered
template as a string; can be called in one of the following forms:

=over 4

=item render()

Renders a class or instance's template with data from the receiver.  The
template will be retrieved by calling the C<template> method.  Partials will
be fetched by C<partial>.

=item render($tmpl)

Renders the given template with data from the receiver.  Partials will be
fetched by C<partial>.

=over 4

=item $tmpl

The template to render.

=back

=item render($data)

Renders a class or instance's template with data from the receiver.  The
template will be retrieved by calling the C<template> method.  Partials
will be fetched by C<partial>.

=over 4

=item $data

Data (as hash or object) to be interpolated into the template.

=back

=item render($tmpl, $data)

Renders the given template with the given data.  Partials will be fetched
by C<partial>.

=over 4

=item $tmpl

The template to render.

=item $data

Data (as a hash, class, or object) to be interpolated into the template.

=back

=item render($tmpl, $data, $partials)

Renders the given template with the given data.  Partials will be looked up
by calling the given code reference with the partial's name.

=over 4

=item $tmpl

The template to render.

=item $data

Data (as a hash, class, or object) to be interpolated into the template.

=item $partials

A function used to lookup partials.

=back

=item render($tmpl, $data, $partials)

Renders the given template with the given data.  Partials will be looked up
by calling the partial's name as a method on the given class or object.

=over 4

=item $tmpl

The template to render.

=item $data

Data (as a hash, class, or object) to be interpolated into the template.

=item $partials

A thing (class or object) that responds to partial names.

=back

=item render($tmpl, $data, $partials)

Renders the given template with the given data.  Partials will be looked up
in the given hash.

=over 4

=item $tmpl

The template to render.

=item $data

Data (as a hash, class, or object) to be interpolated into the template.

=item $partials

A hash containing partials.

=back

=back

=cut

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

=back

=cut

1;

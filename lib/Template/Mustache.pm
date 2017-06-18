package Template::Mustache;
# ABSTRACT: Drawing Mustaches on Perl for fun and profit

use Moo;
use MooseX::MungeHas { has_rw => [ 'is_rw' ], has_ro => [ 'is_ro' ] };

use Text::Balanced qw/ extract_tagged gen_extract_tagged extract_multiple /;

use Template::Mustache::Token::Template;
use Template::Mustache::Token::Variable;
use Template::Mustache::Token::Verbatim;
use Template::Mustache::Token::Section;
use Template::Mustache::Token::Partial;

use Template::Mustache::Parser;

use Parse::RecDescent;
use List::AllUtils qw/ pairmap /;
use Scalar::Util qw/ blessed /;
use Path::Tiny;

has_ro template_path => (
    coerce => sub {
        return unless defined $_[0];
        my $path = path($_[0]);
        die "'$_[0]' does not exist" unless $path->exists;
        $path = $path->child('Mustache.mustache') 
            if $path->is_dir ;
        $path;
    },
);

has_ro partials_path => (
    lazy => 1,
    default => sub { 
        return unless $_[0]->template_path;
        $_[0]->template_path->parent;
    },
    coerce => sub {
        return unless defined $_[0];
        my $path = path($_[0]);
        die "'$_[0]' does not exist" unless $path->exists;
        $path;
    },
);

has_rw template => (
    trigger => sub { $_[0]->clear_parsed },
    lazy => 1,
    default => sub {
        my $self = shift;
        return unless $self->template_path;
        path($self->template_path)->slurp;
    },
);

has_rw parsed => (
    clearer => 1,
    lazy => 1, 
    default => sub {
        my $self = shift;
        $self->parser->template( 
            $self->template, 
            undef, 
            @{ $self->delimiters } 
        );
    },
);

has_rw delimiters => (
    lazy => 1, 
    default => sub { [ '{{', '}}' ] },
);

has_rw partials => (
    lazy => 1,
    default => sub { 
        my $self = shift;
        
        # TODO I can probably do better than that
        if ( my $path = $self->partials_path ) {
            return $self->_parse_partials( {
                map { 
                    my $name = $_->basename;
                    $name =~ s/\.mustache$//;
                    $name => $_->slurp;
                }
                $self->partials_path->children( qr/\.mustache$/ )
            } );
        }

        return +{}  
    },
    trigger => \&_parse_partials
);

sub _parse_partials {
    my( $self, $partials ) = @_;

    return if ref $partials eq 'CODE';

    while( my ( $name, $template ) = each %$partials ) {
        next if ref $template;
        $partials->{$name} = 
            Template::Mustache->new( template => 
                ref $template ? $template->($name) : $template )->parsed;
    }

    return $partials;
}

has_ro parser => sub { Template::Mustache::Parser->new };

sub render {  
    my $self = shift;

    unless( ref $self ) {
        $self = $self->new unless ref $self;
        my $template = shift;
        $self->template( $template ) if defined $template;
        $self->partials( $_[1] ) if @_ == 2;
    }

    my $context = @_ ? shift : $self;

    $self->parsed->render([ $context ], $self->partials);
}


sub resolve_context {  
    my ( $key, $context ) = @_;

    no warnings 'uninitialized';
    return $context->[0] if $key eq '.' or $key eq '';

    my $first;
    ( $first, $key ) = split '\.', $key, 2;

    CONTEXT:
    for my $c ( @$context ) {
        if ( blessed $c ) {
            next CONTEXT unless $c->can($first);
            return $c->$first;
        }
        if ( ref $c eq 'HASH' ) {
            next CONTEXT unless exists $c->{$first};
            return resolve_context($key,[$c->{$first}]);
        }
    }

    return;
}

our $GRAMMAR = <<'END_GRAMMAR';

<skip:qr//> 

eofile: /^\Z/

template: { my ($otag,$ctag) = @arg ? @arg : ( qw/ {{ }} / );
    $thisparser->{opening_tag} = $otag;
    $thisparser->{closing_tag} = $ctag;
    $thisparser->{prev_is_standalone} = 1;
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
    ( $thisparser->{opening_tag},
        $thisparser->{closing_tag} ) = split /\s+/, $item[1][2];

    Template::Mustache::Token::Verbatim->new( content =>
        $item[1][0] . $item[1][1]
    );
}

delimiter_change_inner: '=' {
    $thisparser->{closing_tag}
} /\s*/ /.*?(?=\=\Q$item[2]\E)/s '=' {
    $item[4]
}

partial: /\s*/ opening_tag '>' /\s*/ /[\w.]+/ /\s*/ closing_tag /\s*/ { 
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    my $indent = '';
    if ( $item[1] =~ /\n/ or $prev ) {
        if ( $item[8] =~ /\n/  or length $text == 0) {
            $item[1] =~ /(^|\n)([ \t]*?)$/;
            $indent = $2;
            $item[8] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
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
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    if ( $item[1] =~ /\n/ or $prev ) {
        if ( $item[8] =~ /\n/ ) {
            $item[1] =~ s/(^|\n)[ \t]*?$/$1/;
            $item[8] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }

    [ $item[5], $item[3] eq '^',
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] )
    ];
}

close_section: /\s*/ opening_tag '/' /\s*/ "$arg[0]" /\s*/ closing_tag /\s*/ {
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    if ( $item[1] =~ /\n/ or $prev) {
        if ( $item[8] =~ /\n/ or length $text == 0 ) {
            $item[1] =~ s/(^|\n)[ \t]*?$/$1/;
            $item[8] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }
    [
        Template::Mustache::Token::Verbatim->new( content => $item[1] ),
        Template::Mustache::Token::Verbatim->new( content => $item[8] ),
    ]
}

standalone_surround: /\s*/ opening_tag /\s*/ <matchrule:$arg[0]_inner> closing_tag /\s*/ {
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;

    if ( $item[1] =~ /\n/ or $prev) {
        if ( $item[6] =~ /\n/  or length $text == 0) {
            $item[1] =~ s/(\r?\n?)\s*?$/$1/;
            $item[6] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }

    [  @item[1,6,4] ],
}

comment: standalone_surround[$item[0]] { 
    Template::Mustache::Token::Verbatim->new( 
        content => $item[1][0] . $item[1][1]
    ),
}

comment_inner: '!' { $thisparser->{closing_tag} } /.*?(?=\Q$item[2]\E)/s

inner_section: ...!close_section[ $arg[0] ] template_item 

section: open_section {$thisoffset} inner_section[ $item[1][0] ](s?) {$thisoffset
    - $item[2]
} close_section[ $item[1][0] ] {
    my $raw = substr( $thisparser->{fulltext}, $item[2], $item[4] );
    Template::Mustache::Token::Template->new( items => [
        $item[1]->[2],
        Template::Mustache::Token::Section->new(
            delimiters => [ map { $thisparser->{$_} } qw/ opening_tag closing_tag / ],
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
    $thisparser->{prev_is_standalone} = 0;
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( name => $item{variable_name} ),
        ]
    );
}

variable_name: /[\w.]+/

verbatim: { $thisparser->{opening_tag} } /^\s*\S*?(?=\Q$item[1]\E|\s|$)/ {
    $thisparser->{prev_is_standalone} = 0;
    Template::Mustache::Token::Verbatim->new( content => $item[2] );
}

END_GRAMMAR


1;

__END__

use strict;
use warnings;


use HTML::Entities;
use File::Spec;
use Scalar::Util 'blessed';

my %TemplateCache;


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


sub read_file {
    my ($filename) = @_;
    return '' unless -f $filename;

    open my $fh, "<", $filename or die "Cannot read from file $filename!";
    sysread($fh, my $data, -s $fh);
    close $fh;

    return $data;
}


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


sub new {
    my ($class, %args) = @_;
    return bless({ %args }, $class);
}

our $template_path = '.';


sub template_path { $Template::Mustache::template_path }

our $template_extension = 'mustache';


sub template_extension { $Template::Mustache::template_extension }


sub template_namespace { '' }

our $template_file;


sub template_file {
    my ($receiver) = @_;
    return $Template::Mustache::template_file
        if $Template::Mustache::template_file;

    my $class = ref $receiver || $receiver;
    $class =~ s/^@{[$receiver->template_namespace()]}:://;
    my $ext  = $receiver->template_extension();
    return File::Spec->catfile(split(/::/, "${class}.${ext}"));
};


sub template {
    my ($receiver) = @_;
    my $path = $receiver->template_path();
    my $template_file = $receiver->template_file();
    return read_file(File::Spec->catfile($path, $template_file));
}


sub partial {
    my ($receiver, $name) = @_;
    my $path = $receiver->template_path();
    my $ext  = $receiver->template_extension();
    return read_file(File::Spec->catfile($path, "${name}.${ext}"));
}


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

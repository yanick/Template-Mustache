package Template::Mustache::Parser;

use strict;
use base 'Exporter';

our @EXPORT_OK = qw/ parse /;

sub error
{
    my ($message, $lineno, $column, $line) = @_;

    $line =~ s/^(\s*)|\s*$//g;
    $column -= ($1 || 0) && length($1);

    die <<ERROR
$message
  Line $lineno
    @{[ $line ]}
    @{[ ' ' x ($column - 1) ]}^
ERROR
}

use namespace::clean;

sub parse
{
    my ($sections, $results) = ([], ['block']);

    local $_ = shift;
    pos() = 0;

    my $state = sub {
        my $pos   = pos();
        my @lines = split "\n", substr($_, 0, $pos);
        return scalar(@lines), length($lines[-1]), /[^\n]* \G [^\n]*/gcxs;
    };

    my %errors = (
        tag_name => sub { error("Illegal tag content '@{[shift]}'", $state->()) },
        open_tag => sub { error("Unclosed tag", $state->()) },
        unopened => sub { error("Closing unopened section '@{[shift]}'", $state->()) },
        unclosed => sub { error("Unclosed section '@{[shift]}'", $state->()) },
    );

    my ($otag, $ctag) = map { "\Q$_\E" } ((shift || '{{'), (shift || '}}'));
    my $tag = '\s*(.*?)\s*';

    SCAN: {
        /\G $otag/gcxs && do {
            # Begin Section -- {{# tag }}
            (/\G \# $tag $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);

                my $block = [ 'block' ];
                push @$results, [ 'section', $1, $block ];
                push @$sections, [ $1, $results ];
                $results = $block;
                redo;
            };

            # Begin Inverted Section -- {{# tag }}
            (/\G \^ $tag $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);

                my $block = [ 'block' ];
                push @$results, [ 'inverted', $1, $block ];
                push @$sections, [ $1, $results ];
                $results = $block;
                redo;
            };

            # End Section -- {{/ tag }}
            (/\G \/ $tag $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);

                my ($section, $result) = @{pop @$sections || []};
                $results = $result;

                if (not defined $section) { $errors{unopened}->($1)       }
                elsif ($section ne $1)    { $errors{unclosed}->($section) }

                redo;
            };

            # Comment Tag -- {{! comment }}
            (/\G ! $tag $ctag/gcxs) && do { redo; };

            # Set Delimiter Tag -- {{= otag ctag =}}
            (/\G = $tag \  $tag = $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);
                $errors{tag_name}->($2) unless length($2);

                $otag = "\Q$1\E";
                $ctag = "\Q$2\E";
                redo;
            };

            # Partials -- {{< tag }} or {{> tag }}
            (/\G < $tag $ctag/gcxs or /\G > $tag $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);
                push @$results, [ partial => $1 ];
                redo;
            };

            # Unescaped Content Tag -- {{{ tag }}} or {{& tag }}
            (/\G \{ $tag \} $ctag/gcxs or /\G \& $tag $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);
                push @$results, [ utag => $1 ];
                redo;
            };

            # HTML Escaped Content Tag -- {{ tag }}
            (/\G $tag $ctag/gcxs) && do {
                $errors{tag_name}->($1) unless length($1);
                push @$results, [ etag => $1 ];
                redo;
            };

            # Opened Tag, Left Unclosed
            $errors{open_tag}->();
        };

        # Simple Text
        /\G (.*?) ($otag)/gcxs && do {
            push @$results, [ text => $1 ];
            pos() -= length $2;
            redo;
        };

        # Remaining Text
        push @$results, [ text => substr($_, pos()) ];
    };

    # Sections still on the stack haven't been closed.
    $errors{unclosed}->(@{@$sections[0]}[0]) if @$sections;

    return $results;
}

1;
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
        /\G (^[ \t]*)? $otag/gmcxs && do {
            my $start_of_line = defined $1;
            my $padding = $1;

            # Begin Section -- {{# tag }}
            (/\G \# $tag $ctag/gcxs) && do {
                my $name = $1;

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($name) unless length($name);

                my $block = [ 'block' ];
                push @$results, [ 'section', $name, $block ];
                push @$sections, [ $name, $results ];
                $results = $block;

                redo;
            };

            # Begin Inverted Section -- {{^ tag }}
            (/\G \^ $tag $ctag/gcxs) && do {
                my $name = $1;

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($name) unless length($name);

                my $block = [ 'block' ];
                push @$results, [ 'inverted', $name, $block ];
                push @$sections, [ $name, $results ];
                $results = $block;

                redo;
            };

            # End Section -- {{/ tag }}
            (/\G \/ $tag $ctag/gcxs) && do {
                my $name = $1;

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($name) unless length($name);

                my ($section, $result) = @{pop @$sections || []};
                $results = $result;

                if (not defined $section) { $errors{unopened}->($name)       }
                elsif ($section ne $name)    { $errors{unclosed}->($section) }

                redo;
            };

            # Comment Tag -- {{! comment }}
            (/\G ! (.*?) $ctag/gmcxs) && do { redo; };

            # Set Delimiter Tag -- {{= otag ctag =}}
            (/\G = $tag \  $tag =? $ctag/gcxs) && do {
                my ($open, $close) = ($1, $2);

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($open) unless length($open);
                $errors{tag_name}->($close) unless length($close);

                $otag = "\Q$open\E";
                $ctag = "\Q$close\E";

                redo;
            };

            # Partials -- {{< tag }} or {{> tag }}
            (/\G < $tag $ctag/gcxs or /\G > $tag $ctag/gcxs) && do {
                my $name = $1;

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($name) unless length($name);
                push @$results, [ partial => $name, ($padding || '') ];

                redo;
            };

            # Unescaped Content Tag -- {{{ tag }}} or {{& tag }}
            (/\G \{ $tag \} $ctag/gcxs or /\G \& $tag $ctag/gcxs) && do {
                my $name = $1;

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($name) unless length($name);
                push @$results, [ utag => $name ];

                redo;
            };

            # HTML Escaped Content Tag -- {{ tag }}
            (/\G $tag $ctag/gcxs) && do {
                my $name = $1;

                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                $errors{tag_name}->($name) unless length($name);
                push @$results, [ etag => $name ];

                redo;
            };

            # Opened Tag, Left Unclosed
            $errors{open_tag}->();
        };

        # Simple Text
        /\G (.*?) ((^[ \t]*|) $otag)/gmcxs && do {
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
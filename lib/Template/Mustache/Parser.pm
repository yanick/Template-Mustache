# Template::Mustache's parser.
#
# This class is currently quite a mess; the entire parser is written to make
# use of Perl's regular expression state machine, but limitations on the
# accessibility of that data across (Perl) stack frames mean that the entire
# parsing routine needs to be crammed into a single method.  The parser should
# be fairly straightforward to rewrite in terms of a character- or line-based
# state machine, but that implementation has not taken shape yet.
#
# @api private
package Template::Mustache::Parser;

use strict;
use base 'Exporter';

our @EXPORT_OK = qw/ parse /;

# Raise an error, with the appropriate context from the template.
# @param $message [String] Cause of death.
# @param $lineno [Integer] The line number we choked on.
# @param $column [Integer] The column number we choked on, approximately.
# @param $column [String] The line in question.
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

# Walks over the given string, and generates an abstract syntax tree for the
# template.  Most often passed to the Generator's #build method.
# @param $tmpl [String] The template string to parse.
# @see Template::Mustache::Generator#build
sub parse
{
    local $_ = shift;
    my ($sections, $results) = ([], ['block']);

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
        my $before_match = pos();
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
                push @$sections, [ $name, $results, pos() ];
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
                push @$sections, [ $name, $results, pos() ];
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

                my ($section, $result, $start) = @{pop @$sections || []};
                push(@$results, substr($_, $start, $before_match - $start));
                $results = $result;


                if (not defined $section) { $errors{unopened}->($name)    }
                elsif ($section ne $name) { $errors{unclosed}->($section) }

                redo;
            };

            # Comment Tag -- {{! comment }}
            (/\G ! (.*?) $ctag/gmcxs) && do {
                if ($start_of_line && !/\G \n/gcxs) {
                    push @$results, [ text => $padding ];
                }

                redo;
            };

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

                # Interpolation should always respect all existing content.
                push @$results, [ text => $padding ] if $padding;

                $errors{tag_name}->($name) unless length($name);
                push @$results, [ utag => $name ];

                redo;
            };

            # HTML Escaped Content Tag -- {{ tag }}
            (/\G $tag $ctag/gcxs) && do {
                my $name = $1;

                # Interpolation should always respect all existing content.
                push @$results, [ text => $padding ] if $padding;

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
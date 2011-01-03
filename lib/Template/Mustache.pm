# Template::Mustache is an implementation of the fabulous Mustache templating
# language for Perl 5.8 and later.
#
# Information about the design and syntax of Mustache can be found
# [here](http://mustache.github.com).
package Template::Mustache;
use strict;
use warnings;

use CGI ();

sub parse {
    my ($tmpl, $delims, $section, $start) = @_;
    my @buffer;

    my ($otag, $ctag) = @{ $delims || [qw'{{ }}'] };
    my $build_regex = sub {
        return qr/
            ((?:.|\n)*?)                # Capture the pre-tag content
            ([ \t]*)                    # Capture the pre-tag whitespace
            (?:\Q$otag\E \s*)           # Match the opening of the tag
            (?:
                (=)   \s* (.+?) \s* = | # Capture Set Delimiters
                ({)   \s* (.+?) \s* } | # Capture Triple Mustaches
                (\W?) \s* ((?:.|\n)+?)  # Capture everything else
            )
            (?:\s* \Q$ctag\E)           # Match the closing of the tag
        /xm;
    };

    my $pattern = $build_regex->();
    my $pos = pos($tmpl) = $start ||= 0;

    while ($tmpl =~ m/\G$pattern/gc) {
        my ($content, $whitespace) = ($1, $2);
        my $type = $3 || $5 || $7;
        my $tag  = $4 || $6 || $8;

        my $eoc = $pos + length($content) - 1;
        $pos = pos($tmpl);

        my $is_standalone = (substr($tmpl, $eoc, 1) || "\n") eq "\n" &&
                            (substr($tmpl, $pos, 1) || "\n") eq "\n";

        push @buffer, $content;

        if ($is_standalone && ($type !~ /^[\{\&]?$/)) {
            $pos += 1;
        } elsif ($whitespace) {
            push @buffer, $whitespace;
            $whitespace = '';
        }

        if ($type eq '!') {
            # Do nothing...
        } elsif ($type eq '{' || $type eq '&' || $type eq '') {
            push @buffer, [$type, $tag];
        } elsif ($type eq '#' || $type eq '^') {
            (my $raw, $pos) = parse($tmpl, [$otag, $ctag], $tag, $pos);
            push @buffer, [ $type, $tag, [$raw, [$otag, $ctag]] ];
        } elsif ($type eq '/') {
            return (substr($tmpl, $start, $eoc - ($start - 1)), $pos);
        }

        pos($tmpl) = $pos
    }

    push @buffer, substr($tmpl, $pos);

    return \@buffer;
}

sub generate {
    my ($parse_tree, @context) = @_;

    my $build = sub {
        return generate(parse(@_), @context);
    };

    my @parts;
    for my $part (@$parse_tree) {
        push(@parts, $part) and next unless ref $part;
        my ($type, $tag, $data) = @$part;
        my $value = lookup($tag, @context);

        if ($type eq '') {
            push @parts, CGI::escapeHTML($value);
        } elsif ($type eq '&' || $type eq '{') {
            push @parts, $value;
        } elsif ($type eq '#') {
            next unless $value;
            push @parts, $build->(@$data);
        } elsif ($type eq '^') {
            next if $value;
            push @parts, $build->(@$data);
        }
    }

    return join '', @parts;
}

sub lookup {
    my ($field, @context) = @_;
    my $value = '';

    for my $index (reverse 0..$#{[@context]}) {
        my $ctx = $context[$index];
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

    return $value;
}

# Renders a template with the given data.
#
# @param [String] $tmpl The template to render.
# @param [Hash,Class,Object] $data Data to interpolated into the template.
# @return [String] The fully rendered template.
sub render {
    my ($receiver, $tmpl, $data) = @_;
    my $parsed = parse($tmpl);
    return generate($parsed, $data);
}

1;

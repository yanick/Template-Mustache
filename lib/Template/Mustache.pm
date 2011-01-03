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
            (?:\Q$otag\E \s*)           # Match the opening tag
            (?:
                (=)   \s* (.+?) \s* = | # Capture Set Delimiters
                ({)   \s* (.+?) \s* } | # Capture Triple Mustaches
                (\W?) \s* ((?:.|\n)+?)  # Capture everything else
            )
            (?:\s* \Q$ctag\E)           # Match the closing tag
        /xm;
    };

    my $pattern = $build_regex->();
    my $pos = pos = $start || 0;

    while (my @match = ($tmpl =~ m/\G$pattern/gc)) {
        my ($content, $whitespace) = @match[0,1];
        my $type = $match[2] || $match[4] || $match[6];
        my $tag  = $match[3] || $match[5] || $match[7];

        my $contentEnd = $pos + length($content) - 1;
        $pos = pos($tmpl);

        my $isStandalone = (substr($tmpl, $contentEnd, 1) || "\n") eq "\n" &&
                           (substr($tmpl, $pos, 1) || "\n")        eq "\n";

        push @buffer, $content;

        if ($isStandalone && ($type !~ /^[\{\&]?$/)) {
            $pos = pos($tmpl) += 1;
        } elsif ($whitespace) {
            push @buffer, $whitespace;
            $whitespace = '';
        }

        if ($type eq '!') {
            # Do nothing...
        } elsif ($type =~ /^[\{\&]?$/) {
            push @buffer, [$type, $tag];
        }
    }

    push @buffer, substr($tmpl, $pos);

    return \@buffer;
}

sub generate {
    my ($parse_tree, @context) = @_;

    my @parts;
    for my $part (@$parse_tree) {
        push(@parts, $part) and next unless ref $part;
        my ($type, $tag, $data) = @$part;
        my $value = lookup($tag, @context);

        if ($type eq '') {
            push @parts, CGI::escapeHTML($value);
        } elsif ($type eq '&' || $type eq '{') {
            push @parts, $value;
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

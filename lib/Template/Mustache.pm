# Template::Mustache is an implementation of the fabulous Mustache templating
# language for Perl 5.8 and later.
#
# Information about the design and syntax of Mustache can be found
# [here](http://mustache.github.com).
package Template::Mustache;
use strict;
use warnings;

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
            pos($tmpl) += 1;
        } elsif ($whitespace) {
            push @buffer, $whitespace;
            $whitespace = '';
        }

        if ($type eq '!') {
            # Do nothing...
        }
    }

    push @buffer, substr($tmpl, pos($tmpl));

    return \@buffer;
}

# Renders a template with the given data.
#
# @param [String] $tmpl The template to render.
# @param [Hash,Class,Object] $data Data to interpolated into the template.
# @return [String] The fully rendered template.
sub render {
    my ($receiver, $tmpl, $data) = @_;
    my $parsed = parse($tmpl);
    return join '', @$parsed;
}

1;

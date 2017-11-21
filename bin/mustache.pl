#!/usr/bin/env perl
# Original: https://github.com/defunkt/mustache/blob/master/bin/mustache

# PODNAME: mustache.pl

use strict;
use warnings;
use autodie;

use Template::Mustache;
use YAML::XS qw/ Load /;

my ($self, $args) = @_;
my @args = $args ? @$args : @ARGV;
my $cli_opt = shift @args || '-h';

if ($cli_opt eq "-h" and -t STDIN) {
    print "Usage: mustache FILE ...\n";
    print "`perldoc mustache` for more usage info.\n";
}
else {
    my $doc = join('', <>);
    if($doc =~ /^(\s*---(.+)---\s*)/isg) {
        my $yml = $2;
        $doc =~ s/\Q$1\E//g; # remove YAML data block, quote metachars
        $yml =~ s/^\s+|\s+$//g; # trim whitespace
        $yml = Load($yml);
        print Template::Mustache->render($doc, $yml);
    }
    else {
        print Template::Mustache->render($doc);
    }
}

__END__

=pod

=encoding UTF-8

=head1 NAME

mustache.pl

=head1 VERSION

version 1.2.0

=head1 NAME

mustache.pl - Command line frontend for mustache logic-less templates.

  Usage: mustache.pl FILE ...

See mustache(1) or http://mustache.github.io/mustache.1.html for more details.

=head1 RECIPES

Examples:

  $ mustache.pl data.yml template.mustache
  $ cat data.yml | mustache.pl - template.mustache
  $ cat data.yml template.mustache | mustache.pl

=head1 AUTHORS

=over 4

=item *

Pieter van de Bruggen <pvande@cpan.org>

=item *

Yanick Champoux <yanick@cpan.org>

=item *

Ricardo Signes <rjbs@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2017, 2016, 2015, 2011 by Pieter van de Bruggen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

package SpecCompatibility; ## no critic (RequireFilenameMatchesPackage)
use base 'Test::Mini::TestCase';

use strict;
use warnings;

use Test::Mini::Assertions;

use Template::Mustache;

use File::Basename        qw/ basename dirname /;
use File::Spec::Functions qw/ catfile /;

use YAML::Syck ();
$YAML::Syck::ImplicitTyping = 1;

use Data::Dumper;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Quotekeys = 0;
$Data::Dumper::Indent = 0;
$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Deparse = 1;

my $specs = catfile(dirname(__FILE__), '..', 'ext', 'spec', 'specs');
for my $file (glob catfile($specs, '*.yml')) {
    my $spec = YAML::Syck::LoadFile($file);
    ($file = basename($file)) =~ s/[^\w.]//g;

    no strict 'refs';
    @{"$file\::ISA"} = 'Test::Mini::TestCase';

    for my $test (@{$spec->{tests}}) {
        (my $name = $test->{name}) =~ s/'/"/g;

        *{"$file\::test - @{[$name]}"} = sub {
            my ($self) = @_;

            my $expected = $test->{expected};
            my $tmpl = $test->{template};
            my $data = $test->{data};
            my $partials = $test->{partials};

            # Ensure that lambdas are properly setup.
            my @hashes = $data;
            for my $hash (@hashes) {
                while (my ($k, $v) = each %$hash) {
                    $hash->{$k} = eval $v->{perl} if ref $v eq 'code';
                    push @hashes, $v              if ref $v eq 'HASH';
                }
            }

            my $actual = Template::Mustache->render($tmpl, $data, $partials);

            assert_equal($actual, $expected,
                "$test->{desc}\n".
                "Data:     @{[ Dumper $test->{data} ]}\n".
                "Template: @{[ Dumper $test->{template} ]}\n".
                "Partials: @{[ Dumper ($test->{partials} || {}) ]}\n"
            );
        };
    }
}

sub test_spec_was_tested {
    assert(1);
    skip "Couldn't find specs; try running `git submodule update --init`"
        unless glob catfile($specs, '*.yml');
}

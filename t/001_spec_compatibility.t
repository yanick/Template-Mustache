use Test::More;
use Test::Most;

use strict;
use warnings;

use Template::Mustache;

use Path::Tiny;

use YAML::XS ();

my $specs_dir = path( 'ext', 'spec', 'specs');

plan skip_all => "Couldn't find specs; try running `git submodule update --init`"
    unless $specs_dir->is_dir;

my @specs = @ARGV 
    ? ( map { $specs_dir->child( $_ . '.yml' ) } @ARGV )
    : $specs_dir->children( qr/\.yml$/ );

# only wrap in a subtest if there are more than one file involved

if ( @specs == 1 ) {
    bail_on_fail;
    test_spec( @specs );
}
else {
    subtest $_ => sub{ test_spec($_) } for @specs;
}

done_testing;

sub test_spec { 
    my $file = shift;

    my $spec = YAML::XS::LoadFile($file);

    for my $test (@{$spec->{tests}}) {
        (my $name = delete $test->{name}) =~ s/'/"/g;

        subtest $name => sub {

            my $expected = delete $test->{expected};
            my $tmpl = $test->{template};
            my $data = $test->{data};
            my $partials = $test->{partials};

            if ( $data->{lambda} ) {
                $data->{orig_lambda} = $data->{lambda}{perl};
                $data->{lambda} = eval $data->{lambda}{perl};
            }

            # Ensure that lambdas are properly setup.
            my @hashes = $data;
            for my $hash (@hashes) {
                while (my ($k, $v) = each %$hash) {
                    $hash->{$k} = eval $v->{perl} if ref $v eq 'code';
                    push @hashes, $v              if ref $v eq 'HASH';
                }
            }

            my $actual = Template::Mustache->render($tmpl, $data, $partials);

            is($actual, $expected, delete $test->{desc}) or diag explain $test;
        };
    }
}

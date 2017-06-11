use Test::More;

use strict;
use warnings;

use Template::Mustache;

use Path::Tiny;

use YAML::Syck ();
$YAML::Syck::ImplicitTyping = 1;


my $specs_dir = path( 'ext', 'spec', 'specs');

plan skip_all => "Couldn't find specs; try running `git submodule update --init`"
    unless $specs_dir->is_dir;

my @specs = @ARGV 
    ? ( map { $specs_dir->child( $_ . '.yml' ) } @ARGV )
    : $specs_dir->children( qr/\.yml$/ );

# only wrap in a subtest if there are more than one file involved

if ( @specs == 1 ) {
    test_spec( @specs );
}
else {
    subtest $_ => sub{ test_spec($_) } for @specs;
}

done_testing;

sub test_spec { 
    my $file = shift;

    my $spec = YAML::Syck::LoadFile($file);

    for my $test (@{$spec->{tests}}) {
        (my $name = $test->{name}) =~ s/'/"/g;

        subtest $name => sub {

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

            is($actual, $expected, $test->{desc}) or diag explain $test;
        };
    }
}

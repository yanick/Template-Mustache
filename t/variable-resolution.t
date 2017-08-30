use Test::More tests => 3;

use Template::Mustache;

is( Template::Mustache->render( '{{ foo.1 }}', { foo => [ 'potato', 'banana' ] } ) => 'banana', 'arrayref' );

{
    package Decs;
    use Moose;

    has some_hash => (
        is      => 'rw',
        isa     => 'HashRef',
        default => sub { { 'k1' => 'v1', 'k2' => 'v2' } }
    );

    sub bar { { baz => [ 'quux' ] } }
}

my $self = Decs->new();

is(Template::Mustache->render( '{{ some_hash.k1 }}', $self ), 'v1', 'object with sub-level'  );

is( Template::Mustache->render( '{{ bar.baz.0 }}', $self ) => 'quux', 'all types' );

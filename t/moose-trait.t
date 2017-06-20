use Test::More;

use Test::Requires {
    Moose => 0,
};

use strict;
use warnings;

{
    package Foo;
    use Moose;
    use Template::Mustache::Trait;

    has foo => (
        is => 'ro',
        traits => [ 'Mustache' ],
        default => 'Hello {{ name }}',
        lazy => 1,
        handles => [ 'render' ],
    );

    has name => (
        is => 'rw',
        default => 'world'
    );
}

my $foo = Foo->new;

is $foo->render => 'Hello world';

done_testing;

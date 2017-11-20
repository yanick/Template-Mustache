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

    has bar => (
        is => 'ro',
        traits => [ 'Mustache' ],
        default => sub { 'Hello {{ name }}' },
        lazy => 1,
        handles => { render_bar => 'render' },
    );

    has name => (
        is => 'rw',
        default => 'world'
    );
}

my $foo = Foo->new;

is $foo->render     => 'Hello world', 'default as a string';
is $foo->render_bar => 'Hello world', 'default as a coderef';

done_testing;

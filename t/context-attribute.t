use Test::More;

use strict;
use warnings;

use Template::Mustache;

my $mustache = Template::Mustache->new( 
    context => 'World',
    template => 'Hello {{ . }}'
);

is $mustache->render => 'Hello World', 'default context';
is $mustache->render( 'Bob' ), 'Hello Bob', 'explicit context';
is $mustache->render( undef ), 'Hello ', 'explicit undef';

done_testing;

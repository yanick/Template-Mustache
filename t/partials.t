use Test::More;

use strict;
use warnings;

use Template::Mustache;

my $mustache = Template::Mustache->new;

$mustache->partials({
    inner => 'Yay!'
});

is $mustache->render( 'x{{> inner}}' ), 'xYay!', 'partial';

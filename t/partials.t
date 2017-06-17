use Test::More;

use strict;
use warnings;

use Template::Mustache;

my $mustache = Template::Mustache->new(
    partials => {
        inner => 'Yay!'
    },
    template => 'x{{> inner}}'
);

is $mustache->render, 'xYay!', 'partial';

done_testing;

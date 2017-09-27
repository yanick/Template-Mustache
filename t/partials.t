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


$mustache = Template::Mustache->new(
    partials => {
        'inner-hyphen' => 'Yay!Yay!'
    },
    template => 'x{{> inner-hyphen}}'
);

is $mustache->render, 'xYay!Yay!', 'hyphen';

done_testing;

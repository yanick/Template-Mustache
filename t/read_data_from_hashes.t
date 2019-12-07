use strict;
use warnings;

use Test2::V0;

use Template::Mustache;

my $self = {};

$self->{template} = '[ {{1}}, {{#sub}}{{2}}, {{3}}{{/sub}}, {{4}} ]';
$self->{data} = {
    1 => 'a, b',
    sub => {
        2 => 'c',
        3 => 'd',
    },
    4 => 'e, f',
};

$self->{expected} = '[ a, b, c, d, e, f ]';

my $rendered = Template::Mustache->render(
    $self->{template},
    $self->{data},
);

is($rendered, $self->{expected});

done_testing;

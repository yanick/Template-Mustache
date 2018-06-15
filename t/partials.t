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

subtest "passing of context" => sub {
    my $mustache = Template::Mustache->new(
        partials => {
            'inner' => '.{{ foo }}'
        },
        template => '{{foo}}{{> inner}}'
    );

    is $mustache->render({ foo => '!' }), '!.!';
};

subtest "passing of context with path" => sub {
    my $mustache = Template::Mustache->new(
        partials_path => 't/corpus/partials',
        template => '{{foo}}{{> inner}}'
    );

    is $mustache->render({ foo => '!' }), "!.!\n";
};

done_testing;

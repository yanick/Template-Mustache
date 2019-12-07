use strict;
use warnings;

use Test2::V0;

use Template::Mustache;

subtest 'from template_path' => sub {
    my $rendered = Template::Mustache->new(
        template_path => 't/corpus/',
        template      => '[ {{> ./partials/list1}}, {{> partials/list2}} ]',
    )->render;

    is $rendered, '[ a, b, c, d, e, f ]';
};

subtest 'from template_path, partial_path' => sub {
    my $rendered = Template::Mustache->new(
        partials_path => 't/corpus/',
        template      => '[ {{> ./partials/list1}}, {{> partials/list2}} ]',
    )->render;

    is $rendered, '[ a, b, c, d, e, f ]';
};

done_testing;

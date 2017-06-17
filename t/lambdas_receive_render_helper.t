use Test::More;

use strict;
use warnings;

use Template::Mustache;

{
    package t::LambdasReceiveRenderHelper::Mustache;
    use base 'Template::Mustache';

    sub name         { sub { pop->('{{user}}') } }
    sub obfuscated   { sub { pop->('{{'.reverse(shift).'}}') } }
    sub user         { '({{logged_in_as}})' }
    sub logged_in_as { 'Sam' }
}

subtest Interpolation => sub {
    my $self = {};

    $self->{tmpl} = 'I am {{name}}';

    subtest from_hash => sub {
        my $data = {
            name         => sub { pop->('{{user}}') },
            user         => '({{logged_in_as}})',
            logged_in_as => 'Sam',
        };

        my $rendered = Template::Mustache->render($self->{tmpl}, $data);
        is ($rendered, 'I am (Sam)');
    };

    subtest from_instance => sub {
        my $data = t::LambdasReceiveRenderHelper::Mustache->new();

        my $rendered = Template::Mustache->render($self->{tmpl}, $data);
        is($rendered, 'I am (Sam)');
    };
};

subtest SectionTags => sub {
    my $self = { tmpl => 'I am {{#obfuscated}}resu{{/obfuscated}}' };

    subtest from_hash => sub {
        my $data = {
            obfuscated   => sub { pop->('{{'.reverse(shift).'}}') },
            user         => '({{logged_in_as}})',
            logged_in_as => 'Sam',
        };

        my $rendered = Template::Mustache->render($self->{tmpl}, $data);
        is($rendered, 'I am (Sam)');
    };

    subtest from_instance => sub {
        my $data = t::LambdasReceiveRenderHelper::Mustache->new();

        my $rendered = Template::Mustache->render($self->{tmpl}, $data);
        is($rendered, 'I am (Sam)');
    };
};

done_testing;

use strict;
use warnings;

use Test::Mini::Unit;
use Template::Mustache;

case t::ReadDataFromHashes {
    setup {
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
    }

    test rendering {
        my $rendered = Template::Mustache->render(
            $self->{template},
            $self->{data},
        );

        assert_equal($rendered, $self->{expected});
    }
}

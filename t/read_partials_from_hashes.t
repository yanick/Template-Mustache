use strict;
use warnings;

use Test::Mini::Unit;
use Template::Mustache;

case t::ReadPartialsFromHashes {
    setup {
        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{partials} = {
            list1 => 'a, b, c',
            list2 => 'd, e, f',
        };

        $self->{expected} = '[ a, b, c, d, e, f ]';
    }

    test rendering {
        my $rendered = Template::Mustache->render(
            $self->{template},
            $self->{data},
            $self->{partials},
        );

        assert_equal($rendered, $self->{expected});
    }
}

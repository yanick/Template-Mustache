use Test::Mini::Unit;
use Template::Mustache;

case t::ReadPartialsFromSubs {
    setup {
        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{partials} = sub {
            return 'a, b, c' if $_[0] eq 'list1';
            return 'd, e, f' if $_[0] eq 'list2';
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

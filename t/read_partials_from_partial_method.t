use Test::Mini::Unit;

case t::ReadPartialsFromPartialMethod {
    {
        package t::ReadPartialsFromPartialMethod::Mustache;
        use base 'Template::Mustache';

        sub partial {
            my ($receiver, $name) = @_;
            return 'a, b, c' if $name eq 'list1';
            return 'd, e, f' if $name eq 'list2';
        }
    }

    setup {
        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{expected} = '[ a, b, c, d, e, f ]';
    }

    test rendering {
        my $rendered = t::ReadPartialsFromPartialMethod::Mustache->render(
            $self->{template},
            $self->{data},
        );

        assert_equal($rendered, $self->{expected});
    }
}

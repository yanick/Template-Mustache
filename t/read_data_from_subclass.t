use Test::Mini::Unit;
use Template::Mustache;

case t::ReadDataFromSubclass {
    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::ReadDataFromSubclass::Mustache;
        use base 'Template::Mustache';

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
        sub is_instance { ref(shift) ? 'yes' : 'no' }
    }
    setup {
        $self->{template} = '{{name}} the {{occupation}} ({{is_instance}})';
    }

    test class_render {
        my $rendered = t::ReadDataFromSubclass::Mustache->render(
            $self->{template},
        );
        assert_equal($rendered, "Joe the Plumber (no)");
    }

    test instance_render {
        my $rendered = t::ReadDataFromSubclass::Mustache->new()->render(
            $self->{template},
        );
        assert_equal($rendered, "Joe the Plumber (yes)");
    }
}

use Test::Mini::Unit;
use Template::Mustache;

case t::ReadTemplatesFromSubclass {
    {
        package t::ReadTemplatesFromSubclass::Mustache;
        use base 'Template::Mustache';

        sub template {
            my $is_instance = ref(shift) ? 'yes' : 'no';
            return "{{name}} the {{occupation}} ($is_instance)";
        }

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
    }

    test class_render {
        my $rendered = t::ReadTemplatesFromSubclass::Mustache->render();
        assert_equal($rendered, "Joe the Plumber (no)");
    }

    test instance_render {
        my $rendered = t::ReadTemplatesFromSubclass::Mustache->new()->render();
        assert_equal($rendered, "Joe the Plumber (yes)");
    }
}

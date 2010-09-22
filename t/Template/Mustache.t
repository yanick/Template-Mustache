use Test::Mini::Unit;

require 'fixtures/Simple.pm';
require 'fixtures/Namespace.pm';

case Template::Mustache::Test
{
    use aliased 'Template::Mustache';
    use aliased 'Template::Mustache::Template';

    use File::chdir;
    use File::Spec::Functions qw/ catfile /;
    use File::Slurp qw/ slurp /;

    teardown {
        my $CONFIG = Mustache->CONFIG;
        for my $key (keys %$CONFIG) {
            delete $CONFIG->{$key} if $key =~ /#/;
        }
    }

    test class_config_gets_and_sets_appropriately
    {
        assert_undef(Mustache->CONFIG('parameter'));

        Mustache->CONFIG(parameter => 'value');

        assert_equal(Mustache->CONFIG('parameter'), 'value');
    }

    test class_config_is_not_shared_by_subclasses
    {
        assert_undef(Simple->CONFIG('parameter'));

        Mustache->CONFIG(parameter => 'value');

        assert_undef(Simple->CONFIG('parameter'));
        assert_equal(Mustache->CONFIG('parameter'), 'value');
    }

    test instance_config_gets_and_sets_appropriately
    {
        my $mustache = Mustache->new();
        assert_undef($mustache->CONFIG('parameter'));

        $mustache->CONFIG(parameter => 'value');

        assert_equal($mustache->CONFIG('parameter'), 'value');
    }

    test class_config_is_inherited_by_instances
    {
        my $mustache = Mustache->new();
        assert_undef($mustache->CONFIG('parameter'));

        Mustache->CONFIG(parameter => 'value');

        assert_equal($mustache->CONFIG('parameter'), 'value');
    }

    test class_config_is_masked_by_instances
    {
        my $mustache = Mustache->new();
        assert_undef(Mustache->CONFIG('parameter'));

        $mustache->CONFIG(parameter => 'value');

        assert_undef(Mustache->CONFIG('parameter'));
        assert_equal($mustache->CONFIG('parameter'), 'value');
    }

    test config_resets_compilation_status_when_template_path_changes
    {
        Mustache->CONFIG(template => Template->new());
        assert(Mustache->is_compiled);

        Mustache->CONFIG(template_path => 'fixtures');
        refute(Mustache->is_compiled);
    }

    test config_resets_compilation_status_when_template_name_changes
    {
        Mustache->CONFIG(template => Template->new());
        assert(Mustache->is_compiled);

        Mustache->CONFIG(template_name => 'moustache');
        refute(Mustache->is_compiled);
    }

    test config_resets_compilation_status_when_template_extension_changes
    {
        Mustache->CONFIG(template => Template->new());
        assert(Mustache->is_compiled);

        Mustache->CONFIG(template_extension => 'moustache');
        refute(Mustache->is_compiled);
    }

    test config_resets_compilation_status_when_template_file_changes
    {
        Mustache->CONFIG(template => Template->new());
        assert(Mustache->is_compiled);

        Mustache->CONFIG(template_file => 'fixtures/moustache.moustache');
        refute(Mustache->is_compiled);
    }

    test config_resets_compilation_status_when_namespace_changes
    {
        Mustache->CONFIG(template => Template->new());
        assert(Mustache->is_compiled);

        Mustache->CONFIG(namespace => 'Foo::Bar::Baz');
        refute(Mustache->is_compiled);
    }

    test template_path_has_reasonable_default
    {
        assert_equal(Mustache->CONFIG('template_path'), $CWD);
    }

    test template_paths_are_expanded_on_assign
    {
        Mustache->CONFIG(template_path => './fixtures');
        assert_equal(Mustache->CONFIG('template_path'), catfile($CWD, 'fixtures'));
    }

    test template_extension_has_reasonable_default
    {
        assert_equal(Mustache->CONFIG('template_extension'), 'mustache');
    }

    test template_name_has_reasonable_default
    {
        assert_equal(Mustache->CONFIG('template_name'), 'Template/Mustache');
    }

    test template_name_default_respects_namespace
    {
        my $class = 'I::Live::In::A::Namespace';
        assert_equal($class->CONFIG('template_name'), 'I/Live/In/A/Namespace');

        $class->CONFIG(namespace => 'I::Live::In::A');
        assert_equal($class->CONFIG('template_name'), 'Namespace');
    }

    test template_file_has_reasonable_default
    {
        my $expected = "$CWD/Template/Mustache.mustache";
        assert_equal(Mustache->CONFIG('template_file'), $expected);
    }

    test template_has_a_reasonable_default
    {
        local $CWD = 'fixtures';
        my $expected = Template->new(scalar slurp('Simple.mustache'));
        assert_equal(Simple->CONFIG('template'), $expected);
    }

    test templates_are_auto_coerced_automatically
    {
        my $string = 'The {{part}}s on the {{vehicle}} go round and round...';
        Mustache->CONFIG(template => $string);
        assert_equal(Mustache->CONFIG('template'), Template->new($string));
    }

    test render
    {
        Simple->CONFIG(template_path => 'fixtures');
        assert_equal(Simple->render(), <<'TEXT');
Hello Chris
You have just won $10000!
Well, $6000, after taxes.
TEXT
    }

    test render_with_template
    {
        my $string = 'The {{part}}s on the {{vehicle}} go round and round...';
        assert_equal(
            Mustache->render($string, { part => 'wheel', vehicle => 'bus' }),
            'The wheels on the bus go round and round...'
        );
    }
}

1;
use Test::Mini::Unit;
use Template::Mustache;

case t::ReadTemplatesFromFileSystemWithNamespace {
    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::ReadTemplatesFromFileSystemWithNamespace::Mustache;
        use base 'Template::Mustache';
        use File::Temp qw/ tempdir /;

        our $tmpdir;
        sub template_path { $tmpdir ||= tempdir(CLEANUP => 1); }

        sub template_namespace { 't' }

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
        sub is_instance { ref(shift) ? 'yes' : 'no' }
    }

    setup {
        my $mustache = 't::ReadTemplatesFromFileSystemWithNamespace::Mustache';
        $self->{class} = $mustache;

        my $tmp = $mustache->template_path();
        mkdir "$tmp/ReadTemplatesFromFileSystemWithNamespace";

        local *FILE;
        open FILE, '+>', "$tmp/ReadTemplatesFromFileSystemWithNamespace/Mustache.mustache";
        print FILE '{{name}} -- {{occupation}} ({{is_instance}})';
        close FILE;
    }

    test class_render {
        assert_equal($self->{class}->render(), "Joe -- Plumber (no)");
    }

    test instance_render {
        assert_equal($self->{class}->new()->render(), "Joe -- Plumber (yes)");
    }
}

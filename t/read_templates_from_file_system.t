use Test::Mini::Unit;
use Template::Mustache;

case t::ReadTemplatesFromFileSystem {
    {
        package t::ReadTemplatesFromFileSystem::Mustache;
        use base 'Template::Mustache';
        use File::Temp qw/ tempdir /;

        our $tmpdir;
        sub template_path { $tmpdir ||= tempdir(CLEANUP => 1); }

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
        sub is_instance { ref(shift) ? 'yes' : 'no' }
    }

    setup {
        my $tmp = t::ReadTemplatesFromFileSystem::Mustache->template_path();
        mkdir "$tmp/t";
        mkdir "$tmp/t/ReadTemplatesFromFileSystem";

        local *FILE;
        my $filename = "$tmp/t/ReadTemplatesFromFileSystem/Mustache.mustache";
        open FILE, '+>', $filename;
        print FILE '{{name}} the {{occupation}} ({{is_instance}})';
        close FILE;
    }

    test class_render {
        my $result = t::ReadTemplatesFromFileSystem::Mustache->render();
        assert_equal($result, "Joe the Plumber (no)");
    }

    test instance_render {
        my $result = t::ReadTemplatesFromFileSystem::Mustache->new()->render();
        assert_equal($result, "Joe the Plumber (yes)");
    }
}

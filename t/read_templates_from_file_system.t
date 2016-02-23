use strict;
use warnings;

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
        my $tmpdir = t::ReadTemplatesFromFileSystem::Mustache->template_path();
        mkdir "$tmpdir/t";
        mkdir "$tmpdir/t/ReadTemplatesFromFileSystem";

        $self->{tmpdir} = $tmpdir;
    }

    case ImplicitFilename {
        setup {
            my $tmp = $self->{tmpdir};

            local *FILE;
            my $filename = "$tmp/t/ReadTemplatesFromFileSystem/Mustache.mustache";
            open FILE, '+>', $filename;
            print FILE '{{name}} the {{occupation}} ({{is_instance}})';
            close FILE;
        }

        test class_render {
            my $renderer = 't::ReadTemplatesFromFileSystem::Mustache';
            assert_equal($renderer->render(), "Joe the Plumber (no)");
        }

        test instance_render {
            my $renderer = t::ReadTemplatesFromFileSystem::Mustache->new();
            assert_equal($renderer->render(), "Joe the Plumber (yes)");
        }
    }

    case ExplicitFilename {
        setup {
            my $tmp = $self->{tmpdir};

            local *FILE;
            my $filename = "$tmp/OtherTemplate.mustache";
            open FILE, '+>', $filename;
            print FILE '{{name}} -- {{occupation}} ({{is_instance}})';
            close FILE;
        }

        setup {
            no strict 'refs';
            my $m = "t::ReadTemplatesFromFileSystem::Mustache::template_file";
            *$m = sub { "OtherTemplate.mustache" };
        }

        test class_render {
            my $renderer = 't::ReadTemplatesFromFileSystem::Mustache';
            assert_equal($renderer->render(), "Joe -- Plumber (no)");
        }

        test instance_render {
            my $renderer = t::ReadTemplatesFromFileSystem::Mustache->new();
            assert_equal($renderer->render(), "Joe -- Plumber (yes)");
        }

        teardown {
            delete $t::ReadTemplatesFromFileSystem::Mustache::{template_file};
        }
    }

    case WithoutSubclass {
        setup {
            my $tmp = $self->{tmpdir};

            local *FILE;
            my $filename = "$tmp/TemplateFile.mustache";
            open FILE, '+>', $filename;
            print FILE '{{name}}, {{occupation}}';
            close FILE;
        }

        test rendering {
            local $Template::Mustache::template_path = $self->{tmpdir};
            local $Template::Mustache::template_file = 'TemplateFile.mustache';
            my $result = Template::Mustache->render({
                name       => 'Joe',
                occupation => 'Plumber',
            });
            assert_equal($result, "Joe, Plumber");
        }
    }
}

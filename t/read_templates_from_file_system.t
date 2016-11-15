use strict;
use warnings;

use Template::Mustache;

use Test::More;

    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::ReadTemplatesFromFileSystem::Mustache;
        use base 'Template::Mustache';
        use File::Temp qw/ tempdir /;

        our $tmpdir;
        sub template_path { $tmpdir ||= tempdir(CLEANUP => 1); }

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
        sub is_instance { ref(shift) ? 'yes' : 'no' }
    }

    my $self = {};
        my $tmpdir = t::ReadTemplatesFromFileSystem::Mustache->template_path();
        mkdir "$tmpdir/t";
        mkdir "$tmpdir/t/ReadTemplatesFromFileSystem";

        $self->{tmpdir} = $tmpdir;

    subtest ImplicitFilename => sub {
            my $tmp = $self->{tmpdir};

            my $filename = "$tmp/t/ReadTemplatesFromFileSystem/Mustache.mustache";
            open my $fh, '+>', $filename;
            print $fh '{{name}} the {{occupation}} ({{is_instance}})';
            close $fh;

        subtest class_render => sub {
            my $renderer = 't::ReadTemplatesFromFileSystem::Mustache';
            is($renderer->render(), "Joe the Plumber (no)");
        };

        subtest instance_render => sub {
            my $renderer = t::ReadTemplatesFromFileSystem::Mustache->new();
            is($renderer->render(), "Joe the Plumber (yes)");
        };
    };

    subtest ExplicitFilename => sub {
            my $tmp = $self->{tmpdir};

            my $filename = "$tmp/OtherTemplate.mustache";
            open my $fh, '+>', $filename;
            print $fh '{{name}} -- {{occupation}} ({{is_instance}})';
            close $fh;

            no strict 'refs';
            my $m = "t::ReadTemplatesFromFileSystem::Mustache::template_file";
            *$m = sub { "OtherTemplate.mustache" };

        subtest class_render => sub {
            my $renderer = 't::ReadTemplatesFromFileSystem::Mustache';
            is($renderer->render(), "Joe -- Plumber (no)");
        };

        subtest instance_render => sub {
            my $renderer = t::ReadTemplatesFromFileSystem::Mustache->new();
            is($renderer->render(), "Joe -- Plumber (yes)");
        };

            delete $t::ReadTemplatesFromFileSystem::Mustache::{template_file};
    };

    subtest WithoutSubclass => sub {
            my $tmp = $self->{tmpdir};

            my $filename = "$tmp/TemplateFile.mustache";
            open my $fh, '+>', $filename;
            print $fh '{{name}}, {{occupation}}';
            close $fh;

        subtest rendering => sub {
            local $Template::Mustache::template_path = $self->{tmpdir};
            local $Template::Mustache::template_file = 'TemplateFile.mustache';
            my $result = Template::Mustache->render({
                name       => 'Joe',
                occupation => 'Plumber',
            });
            is($result, "Joe, Plumber");
        };
    };

done_testing;

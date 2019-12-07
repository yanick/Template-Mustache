use strict;
use warnings;

use Template::Mustache;

use Test2::V0;
use File::Temp qw/ tempdir /;

    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::ReadTemplatesFromFileSystem::Mustache;
        use base 'Template::Mustache';

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
        sub is_instance { ref(shift) ? 'yes' : 'no' }
    }

    my $self = {};
    my $tmpdir = tempdir(CLEANUP => 0);

    subtest ImplicitFilename => sub {

        my $filename = "$tmpdir/Mustache.mustache";
        open my $fh, '>', $filename;
        print $fh '{{name}} the {{occupation}} ({{is_instance}})';
        close $fh;

        subtest instance_render => sub {
            my $renderer = t::ReadTemplatesFromFileSystem::Mustache->new(
                template_path => $tmpdir
            );
            is($renderer->render(), "Joe the Plumber (yes)");
        };
    };

    subtest ExplicitFilename => sub {
            my $filename = "$tmpdir/OtherTemplate.mustache";
            open my $fh, '+>', $filename;
            print $fh '{{name}} -- {{occupation}} ({{is_instance}})';
            close $fh;

            my $m = t::ReadTemplatesFromFileSystem::Mustache->new(
                template_path => $filename
            );


        subtest instance_render => sub {
            is($m->render(), "Joe -- Plumber (yes)");
        };

    };

    subtest WithoutSubclass => sub {

            my $filename = "$tmpdir/TemplateFile.mustache";
            open my $fh, '+>', $filename;
            print $fh '{{name}}, {{occupation}}';
            close $fh;

        subtest rendering => sub {
            my $result = Template::Mustache->new(
                template_path => $filename
            )->render({
                name       => 'Joe',
                occupation => 'Plumber',
            });
            is($result, "Joe, Plumber");
        };
    };

done_testing;

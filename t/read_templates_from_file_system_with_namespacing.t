use strict;
use warnings;

use Template::Mustache;
use Test::More;

subtest ReadTemplatesFromFileSystemWithNamespace => sub {
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

    my $self = {};

        my $mustache = 't::ReadTemplatesFromFileSystemWithNamespace::Mustache';
        $self->{class} = $mustache;

        my $tmp = $mustache->template_path();
        mkdir "$tmp/ReadTemplatesFromFileSystemWithNamespace";

        open my $fh, '+>', "$tmp/ReadTemplatesFromFileSystemWithNamespace/Mustache.mustache";
        print $fh '{{name}} -- {{occupation}} ({{is_instance}})';
        close $fh;

    subtest class_render => sub {
        is($self->{class}->render(), "Joe -- Plumber (no)");
    };

    subtest instance_render => sub {
        is($self->{class}->new()->render(), "Joe -- Plumber (yes)");
    };
};
done_testing

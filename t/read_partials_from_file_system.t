use strict;
use warnings;

use Template::Mustache;

package t::ReadPartialsFromFileSystem;

use Test::More;

    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::ReadPartialsFromFileSystem::Mustache;
        use base 'Template::Mustache';
        use File::Temp qw/ tempdir /;

        our $tmpdir;
        sub template_path { $tmpdir ||= tempdir(CLEANUP => 1); }
    }

        my $tmpdir = t::ReadPartialsFromFileSystem::Mustache->template_path();

        open my $fh, '+>', "${tmpdir}/list1.mustache";
        print $fh "a, b, c";
        close $fh;

        open $fh, '+>', "${tmpdir}/list2.mustache";
        print $fh "d, e, f";
        close $fh;

        my $self = {};

        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{expected} = '[ a, b, c, d, e, f ]';

    subtest rendering => sub {
        my $rendered = t::ReadPartialsFromFileSystem::Mustache->render(
            $self->{template},
            $self->{data},
        );

        is($rendered, $self->{expected});
    };

done_testing

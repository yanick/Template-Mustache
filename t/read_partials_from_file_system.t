use strict;
use warnings;

use Test::Mini::Unit;
use Template::Mustache;

case t::ReadPartialsFromFileSystem {
    {
        package t::ReadPartialsFromFileSystem::Mustache;
        use base 'Template::Mustache';
        use File::Temp qw/ tempdir /;

        our $tmpdir;
        sub template_path { $tmpdir ||= tempdir(CLEANUP => 1); }
    }

    setup {
        my $tmpdir = t::ReadPartialsFromFileSystem::Mustache->template_path();

        open my $fh, '+>', "${tmpdir}/list1.mustache";
        print $fh "a, b, c";
        close $fh;

        open $fh, '+>', "${tmpdir}/list2.mustache";
        print $fh "d, e, f";
        close $fh;

        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{expected} = '[ a, b, c, d, e, f ]';
    }

    test rendering {
        my $rendered = t::ReadPartialsFromFileSystem::Mustache->render(
            $self->{template},
            $self->{data},
        );

        assert_equal($rendered, $self->{expected});
    }
}

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

        local *FILE;
        open FILE, '+>', "${tmpdir}/list1.mustache";
        print FILE "a, b, c";
        close FILE;

        open FILE, '+>', "${tmpdir}/list2.mustache";
        print FILE "d, e, f";
        close FILE;

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

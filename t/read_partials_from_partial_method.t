use strict;
use warnings;

use Test::More;

    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::ReadPartialsFromPartialMethod::Mustache;
        use base 'Template::Mustache';

        sub partial {
            my ($receiver, $name) = @_;
            return 'a, b, c' if $name eq 'list1';
            return 'd, e, f' if $name eq 'list2';
        }
    }

my $self = {};

        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{expected} = '[ a, b, c, d, e, f ]';

    subtest rendering => sub {
        my $rendered = t::ReadPartialsFromPartialMethod::Mustache->render(
            $self->{template},
            $self->{data},
        );

        is($rendered, $self->{expected});
    };

done_testing;

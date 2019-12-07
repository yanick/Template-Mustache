use strict;
use warnings;

use Template::Mustache;

use Test2::V0;

my $self = {};
        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{partials} = sub {
            return 'a, b, c' if $_[0] eq 'list1';
            return 'd, e, f' if $_[0] eq 'list2';
        };

        $self->{expected} = '[ a, b, c, d, e, f ]';

    subtest rendering => sub {
        my $rendered = Template::Mustache->render(
            $self->{template},
            $self->{data},
            $self->{partials},
        );

        is($rendered, $self->{expected});
    };

done_testing;

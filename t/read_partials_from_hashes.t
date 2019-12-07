use strict;
use warnings;

use Template::Mustache;

use Test2::V0;

my $self = {};

        $self->{template} = '[ {{> list1}}, {{> list2}} ]';
        $self->{partials} = {
            list1 => 'a, b, c',
            list2 => 'd, e, f',
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

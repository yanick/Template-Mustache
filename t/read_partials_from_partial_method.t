use strict;
use warnings;

use Test2::V0;
use Template::Mustache;

sub partial {
    my $name = shift;
    return 'a, b, c' if $name eq 'list1';
    return 'd, e, f' if $name eq 'list2';
}

my $self = {};

$self->{template} = '[ {{> list1}}, {{> list2}} ]';
$self->{expected} = '[ a, b, c, d, e, f ]';

subtest rendering => sub {
    my $rendered = Template::Mustache->new(
        template => $self->{template},
        partials => \&partial,
    )->render(
        $self->{data},
    );

    is($rendered, $self->{expected});
};

done_testing;

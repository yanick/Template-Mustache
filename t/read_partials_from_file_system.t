use strict;
use warnings;

use Template::Mustache;

use File::Temp qw/ tempdir /;
$::tmpdir = tempdir(CLEANUP => 0); 

use Test::More;

open my $fh, '+>', "$::tmpdir/list1.mustache";
print $fh "a, b, c";
close $fh;

open $fh, '+>', "$::tmpdir/list2.mustache";
print $fh "d, e, f";
close $fh;

my $self = {};

$self->{template} = '[ {{> list1}}, {{> list2}} ]';
$self->{expected} = '[ a, b, c, d, e, f ]';

subtest 'from template_path' => sub {
    my $rendered = Template::Mustache->new(
        template_path => $::tmpdir,
        template => $self->{template},
    )->render(
        $self->{data},
    );

    is($rendered, $self->{expected});
};

done_testing

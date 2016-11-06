use strict;
use warnings;


package Foo;

use Test::More;

use Template::Mustache;

sub name       { 'Joe' }
sub occupation { 'Plumber' }
sub classname  { shift }

my $self = {};
$self->{template} = '{{name}} the {{occupation}} ({{classname}})';
$self->{expected} = 'Joe the Plumber (Foo)';

my $rendered = Template::Mustache->render(
    $self->{template},
    __PACKAGE__
);
is($rendered, $self->{expected});

done_testing;

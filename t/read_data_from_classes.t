use strict;
use warnings;

package Foo;

use Test2::V0;

use Moo;
extends 'Template::Mustache';

sub name       { 'Joe' }
sub occupation { 'Plumber' }
sub classname  { ref shift }

my $self = {};
$self->{template} = '{{name}} the {{occupation}} ({{classname}})';
$self->{expected} = 'Joe the Plumber (Foo)';

my $rendered = Template::Mustache->render(
    $self->{template},
    __PACKAGE__->new,
);
is($rendered, $self->{expected});

done_testing;

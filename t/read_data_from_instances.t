use strict;

use Template::Mustache;

{
package t::ReadDataFromClasses;

use Test2::V0;

    sub name       { 'Joe' }
    sub occupation { 'Plumber' }
    sub qualified  { (ref $_[0]) . '::' . ($_[0]->{name}) }

    my $self = bless {}, __PACKAGE__;

    my $testname = (ref $self) . '::' . $self->{name};
    $self->{template} = '{{name}} the {{occupation}} ({{qualified}})';
    $self->{expected} = "Joe the Plumber ($testname)";

    my $rendered = Template::Mustache->render($self->{template}, $self);
    is($rendered, $self->{expected});

done_testing;
}

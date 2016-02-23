use strict;
use warnings;

use Test::Mini::Unit;
use Template::Mustache;

case t::ReadDataFromClasses {
    sub name       { 'Joe' }
    sub occupation { 'Plumber' }
    sub qualified  { (ref $_[0]) . '::' . ($_[0]->{name}) }

    setup {
        my $testname = (ref $self) . '::' . $self->{name};
        $self->{template} = '{{name}} the {{occupation}} ({{qualified}})';
        $self->{expected} = "Joe the Plumber ($testname)";
    }

    test rendering {
        my $rendered = Template::Mustache->render($self->{template}, $self);
        assert_equal($rendered, $self->{expected});
    }
}

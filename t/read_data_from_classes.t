use strict;
use warnings;

use Test::Mini::Unit;
use Template::Mustache;

case t::ReadDataFromClasses {
    sub name       { 'Joe' }
    sub occupation { 'Plumber' }
    sub classname  { shift }

    setup {
        $self->{template} = '{{name}} the {{occupation}} ({{classname}})';
        $self->{expected} = 'Joe the Plumber (t::ReadDataFromClasses)';
    }

    test rendering {
        my $rendered = Template::Mustache->render(
            $self->{template},
            ref($self),
        );
        assert_equal($rendered, $self->{expected});
    }
}

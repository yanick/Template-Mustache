use strict;
use warnings;

use Template::Mustache;

{
package t::ReadDataFromSubclass; 

use Test2::V0;

    {
        package t::ReadDataFromSubclass::Mustache;
        use base 'Template::Mustache';

        sub name        { 'Joe' }
        sub occupation  { 'Plumber' }
        sub is_instance { ref(shift) ? 'yes' : 'no' }
    }

    my $self = {};
    $self->{template} = '{{name}} the {{occupation}} ({{is_instance}})';

    subtest class_render => sub {
        my $rendered = t::ReadDataFromSubclass::Mustache->render(
            $self->{template},
        );
        is($rendered, "Joe the Plumber (yes)");
    };

    subtest instance_render => sub {
        my $rendered = t::ReadDataFromSubclass::Mustache->new(
            template => $self->{template} )->render;
        is($rendered, "Joe the Plumber (yes)");
    };

    done_testing;
}

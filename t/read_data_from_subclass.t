use strict;
use warnings;

use Template::Mustache;

{
package t::ReadDataFromSubclass; 

use Test::More;

    {
        ## no critic (RequireFilenameMatchesPackage)
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
        is($rendered, "Joe the Plumber (no)");
    };

    subtest instance_render => sub {
        my $rendered = t::ReadDataFromSubclass::Mustache->new()->render(
            $self->{template},
        );
        is($rendered, "Joe the Plumber (yes)");
    };

    done_testing;
}

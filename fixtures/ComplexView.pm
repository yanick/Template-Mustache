package ComplexView;

use strict;

use base 'Template::Mustache';

__PACKAGE__->CONFIG(template_path => 'fixtures');

sub header { "Colors" }

sub item
{
    return [
        { name => 'red',   current => 1, url => '#Red' },
        { name => 'green', current => 0, url => '#Green' },
        { name => 'blue',  current => 0, url => '#Blue' },
    ];
}

sub link  { not shift->context->get('current') }
sub list  { scalar @{&item} }
sub empty { not scalar @{&item} }
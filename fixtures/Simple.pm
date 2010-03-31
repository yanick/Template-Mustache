package Simple;

use strict;
use base 'Template::Mustache';

__PACKAGE__->CONFIG(template_path => 'fixtures');

sub name        { 'Chris' }
sub value       { 10_000 }
sub taxed_value { value() - (value() * 0.4) }
sub in_ca       { 1 }

1;
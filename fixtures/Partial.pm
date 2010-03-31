package Partial;

use strict;
use base 'Template::Mustache';

__PACKAGE__->CONFIG(template_path => 'fixtures');

sub greeting    { 'Welcome' }
sub name        { 'Bob' }
sub value       { 1_000 }
sub taxed_value { value() - (value() * 0.4) }
sub in_ca       { 1 }
sub farewell    { 'Fair enough, right?' }

1;

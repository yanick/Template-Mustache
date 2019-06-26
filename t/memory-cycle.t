use strict;
use warnings;

use Test::More tests => 1;

use Test::Memory::Cycle;

use Template::Mustache;

my $mustache = Template::Mustache->new({template => 'Hello, {{planet}}'});
$mustache->render({planet => 'World'});

memory_cycle_ok $mustache;

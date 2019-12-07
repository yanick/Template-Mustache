use strict;
use warnings;

use Test2::V0;

eval "use Test::Memory::Cycle; 1"
    or skip_all "Test::Memory::Cycle required";

plan tests => 1;


use Template::Mustache;

my $mustache = Template::Mustache->new({template => 'Hello, {{planet}}'});
$mustache->render({planet => 'World'});

Test::Memory::Cycle::memory_cycle_ok $mustache;

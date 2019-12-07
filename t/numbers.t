use strict;
use warnings;

use Test2::V0;

plan tests => 1;

use Template::Mustache;

my $num = "123456789012345678901";

is( Template::Mustache->render("{{.}}", $num ), $num, "don't touch strings looking like numbers" );

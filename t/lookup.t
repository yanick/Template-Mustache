use Test::More tests => 1;

use strict;
use warnings;

use Template::Mustache;

is( Template::Mustache::lookup( '.' => 'a'..'z' )
    => 'a', '{{.}}' );

use strict;
use warnings;

use Test2::V0;

plan tests => 3;

use Template::Mustache;

my $num = "123456789012345678901";

is( Template::Mustache->render("{{.}}", $num ), $num, "don't touch strings looking like numbers" );

subtest "rendering leading and trailing zeros", sub {
    my $value = "00.120";

    is( Template::Mustache->render("{{.}}", $value ), "0.12", "trailing zeros on numbers are removed" );

    is( Template::Mustache->render("{{.}}", \$value ), "00.120", "trailing zeros on numbers are removed" );
};

subtest "rendering html entities", sub {
    my $value = "<stuff>";

    is( Template::Mustache->render("{{value}}", {value =>$value } ), "&lt;stuff&gt;");

    is( Template::Mustache->render("{{value}}", {value =>\$value } ), "<stuff>");
};

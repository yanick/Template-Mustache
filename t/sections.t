use Test::More;

use strict;
use warnings;

use Template::Mustache;
use Test::Exception;

is( Template::Mustache->render( "{{#foo}}{{.}}{{/foo}}", {foo => "World!"})
    => 'World!' );

is( Template::Mustache->render( "{{#foo }}{{.}}{{/foo}}", {foo => "World!"})
    => 'World!', 'spaces' );


is ''.Template::Mustache->render( "{{#foo }}{{.}}{{/foo }}", {foo => "World!"})
    => 'World!', 'spaces';

is ''.Template::Mustache->render( "{{#foo }}{{.}}{{/ foo }}", {foo => "World!"})
    => 'World!', 'spaces';

dies_ok { Template::Mustache->render( "{{#foo}}{{.}}{{#/foo}}", {foo => "World!"}) } 'bad closure';

is ''.Template::Mustache->render( "{{#foo.bar}}{{.}}{{/foo.bar}}", {foo => { bar => "World!" } })
    => 'World!';

is ''.Template::Mustache->render(
    '{{#a}}{{one}}{{#b}}{{one}}{{two}}{{/b}}{{/a}}',
    { a => { one => 1 }, b => { two => 2 } }
) => '112';

done_testing;

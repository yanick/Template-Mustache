use Test::More;

use strict;
use warnings;

use Template::Mustache;
use Test::Exception;

my $mustache = Template::Mustache->new;

is $mustache->render( "{{#foo}}{{.}}{{/foo}}", {foo => "World!"})
    => 'World!';

is $mustache->render( "{{#foo }}{{.}}{{/foo}}", {foo => "World!"})
    => 'World!', 'spaces';


is $mustache->render( "{{#foo }}{{.}}{{/foo }}", {foo => "World!"})
    => 'World!', 'spaces';

is $mustache->render( "{{#foo }}{{.}}{{/ foo }}", {foo => "World!"})
    => 'World!', 'spaces';

dies_ok { $mustache->render( "{{#foo}}{{.}}{{#/foo}}", {foo => "World!"}) } 'bad closure';

is $mustache->render( "{{#foo.bar}}{{.}}{{/foo.bar}}", {foo => { bar => "World!" } })
    => 'World!';

is $mustache->render(
    '{{#a}}{{one}}{{#b}}{{one}}{{two}}{{/b}}{{/a}}',
    { a => { one => 1 }, b => { two => 2 } }
) => '112';

done_testing;

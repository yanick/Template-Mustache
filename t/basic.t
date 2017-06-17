use Test::More;

use strict;
use warnings;

use Template::Mustache;

sub render_ok(@) {
    my $mustache = Template::Mustache->new( template => shift );
    is $mustache->render( shift ), shift, shift;
}

render_ok @$_ for (
    [ "Hello {{planet}}", {planet => "World!"}, 'Hello World!' ],
    [ "{{a}} and {{b}}", {a => 'this', b => 'that' }, 'this and that' ],
    [ '123{{! no }}456', {}, '123456', 'comment' ],
    [ q(Begin
{{!
    blah blah
}}
{{!  blah blah }}
End), {}, "Begin\nEnd", "standalone comment" ],
);

done_testing;

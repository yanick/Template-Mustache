use Test::More;

use strict;
use warnings;

use Template::Mustache;

my $mustache = Template::Mustache->new;

is $mustache->render( "Hello {{planet}}", {planet => "World!"})
    => 'Hello World!';

is $mustache->render( "{{a}} and {{b}}", {a => 'this', b => 'that' })
    => 'this and that';

is $mustache->render( '123{{! no }}456' ) => '123456', 'comment';

is $mustache->render(<<'END'), "Begin\nEnd\n", "standalone comment";
Begin
{{!
    blah blah
}}
End
END

done_testing;

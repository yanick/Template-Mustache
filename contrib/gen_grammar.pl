use Parse::RecDescent;
use Template::Mustache;

use Path::Tiny;
 
Parse::RecDescent->Precompile( 
    $Template::Mustache::GRAMMAR, "Template::Mustache::Parser"
);

path('Parser.pm')->move( 'lib/Template/Mustache/Parser.pm' );

my $package = path( './lib/Template/Mustache/Parser.pm' );

$package->spew( map { s/^package.*?;/$&\n\n/r } $package->lines );

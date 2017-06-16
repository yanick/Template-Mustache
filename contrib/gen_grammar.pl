use Parse::RecDescent;
use Template::Mustache;
 
Parse::RecDescent->Precompile( 
    Template::Mustache->grammar, "Template::Mustache::Parser"
);

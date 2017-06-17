use Parse::RecDescent;
use Template::Mustache;
 
Parse::RecDescent->Precompile( 
    $Template::Mustache::GRAMMAR, "Template::Mustache::Parser"
);

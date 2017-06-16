# prints a graphical view of the grammar

use strict;
use warnings;

use Template::Mustache;
use GraphViz::Parse::RecDescent;

my $graph = GraphViz::Parse::RecDescent->new(
    Template::Mustache->grammar 
);

open my $png, '>', 'mustache.png';
print $png $graph->as_png;

print "done!\n";

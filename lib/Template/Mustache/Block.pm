package Template::Mustache::Block;

use strict;
use warnings;

use Moo;

sub compile {
    my( $self, $mustache, $pre, $post ) = @_;

    no warnings 'uninitialized';

    return sub { 
        my $context = shift;

        my $content = 
            $mustache->resolve_context( $$self, $context );

        return $mustache->_compile_template($post, $pre . $content )->($context);
    };
}


1;

package Template::Mustache::Block;

use strict;
use warnings;

use Moo;

sub compile {
    my( $self, $mustache, $pre, $post, $standalone_prefix ) = @_;

    return sub { 
        my $context = shift;

        my $content = $context->{$$self};

        return join '',
            $pre, 
            $content,
            $mustache->_compile_template($post)->($context);
    };
}


1;

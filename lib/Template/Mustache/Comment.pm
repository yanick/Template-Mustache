package Template::Mustache::Comment;

use strict;
use warnings;

use Moo;

sub compile {
    my( $self, $mustache, $pre, $post, $standalone_prefix ) = @_;

    no warnings 'uninitialized';


    # standalone
    if( $standalone_prefix and $post =~ /^\s*($|\n)/ ) {
        $pre =~ s/[ \t]*$//;
        $post =~ s/^[ \t]*(\r?\n)?//;
    }

    return sub { 
        my $context = shift;

        return join '',
            $pre, 
            $mustache->_compile_template($post, '', $standalone_prefix)->($context);
    };
}


1;
package Template::Mustache::Comment::Standalone;

use Moo;

extends 'Template::Mustache::Comment';

1;

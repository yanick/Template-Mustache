package Template::Mustache::Partial;

use strict;
use warnings;

use Moo;

sub compile {
    my( $self, $mustache, $pre, $post ) = @_;

    no warnings 'uninitialized';


    # standalone
    if( $post =~ /^\s*($|\n)/ ) {
        $pre =~ s/[ \t]*$//;
        $post =~ s/^[ \t]*(\r?\n)?//;
    }

    my $partial = $mustache->partials->{$$self};

    return sub { 
        my $context = shift;

        return 
            $mustache->_compile_template($post, 
                $mustache->_compile_template( $partial, $pre )->($context) )->($context);
    };
}


1;

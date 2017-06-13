package Template::Mustache::Comment;

use strict;
use warnings;

use Moo;

use Text::Balanced qw/ extract_multiple /;

sub compile {
    my( $self, $mustache, $pre, $post ) = @_;

    no warnings 'uninitialized';

    return sub { 
        my $context = shift;

        return 
            $mustache->_compile_template($post, $pre)->($context);
    };
}


1;

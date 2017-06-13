package Template::Mustache::Pre;

use strict;
use warnings;

use Moo;

sub compile {
    no warnings 'uninitialized';
    my( $self, $mustache, $pre, $post ) = @_;

    $pre .= $$self;

    return $mustache->_compile_template( $post, $pre );
}

1;

package Template::Mustache::StandalonePrefix;
use Moo::Role;

1;

package Template::Mustache::Pre::StandalonePrefix;

use Moo;

with 'Template::Mustache::StandalonePrefix';

sub compile {
    no warnings 'uninitialized';
    my( $self, $mustache, $pre, $post ) = @_;

    return $mustache->_compile_template( $post, $pre . $$self, 1 );
}

1;

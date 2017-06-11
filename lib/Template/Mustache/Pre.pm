package Template::Mustache::Pre;

use strict;
use warnings;

use Moo;

sub compile {
    no warnings 'uninitialized';
    my( $self, $mustache, $pre, $post, $standalone_prefix ) = @_;

    $pre .= $$self;
    # only a standalone prefix is it's all whitespaces
    $standalone_prefix &&= $pre =~ /^\s*$/;

    return $mustache->_compile_template( $post, $pre, $standalone_prefix );
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

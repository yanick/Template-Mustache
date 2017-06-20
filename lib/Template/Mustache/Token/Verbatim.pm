package Template::Mustache::Token::Verbatim;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ], has_rw => [ 'is_rw' ] };

has_ro 'content';
has_rw 'last';

sub render {
    my( $self, undef, undef, $indent ) = @_;
    
    my $value = $self->content;

    if( length $indent ) {
        if ( $self->last ) {
            $value =~ s/(\r?\n)/$1$indent/gm;
            $value =~ s/(\r?\n)$indent$/$1/;
        }
        else {
            $value =~ s/(\r?\n)/$1$indent/gm;
        }
    }

    return $value;
}

1;

package Template::Mustache::Token::Verbatim;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'content';

sub render {
    my( $self, $context ) = @_;
    
    return $self->content;
}

1;

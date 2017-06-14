package Template::Mustache::Token::Template;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'items';

sub flatten {
    return map { ref $_ eq 'ARRAY' ? flatten(@$_) : $_ } grep { ref } @_;
}

sub render {
    my( $self, $context ) = @_;

    return join '', map { $_->render($context) } flatten( @{ $self->items } );
}

1;

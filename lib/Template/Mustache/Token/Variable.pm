package Template::Mustache::Token::Variable;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'name';

sub render {
    my( $self, $context ) = @_;

    return Template::Mustache::resolve_context( $self->name, $context );
}

1;

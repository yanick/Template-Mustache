package Template::Mustache::Token::Section;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'variable';
has_ro 'template';

sub render {
    my( $self, $context ) = @_;

    my $cond = Template::Mustache::resolve_context( $self->variable, $context );

    return unless $cond;

    return $self->template->render( [ $cond, @$context ] );
}

1;

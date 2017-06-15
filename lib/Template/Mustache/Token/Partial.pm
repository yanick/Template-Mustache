package Template::Mustache::Token::Partial;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'name';
has_ro 'indent';

sub render {
    my( $self, $context, $partials ) = @_;

    my $partial = $partials->{$self->name} or return '';

    my $content = $partial->render( $context, $partials, $self->indent );

    return $content;
}

1;

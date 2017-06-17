package Template::Mustache::Token::Partial;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ], has_rw => [ 'is_rw' ] };

has_ro 'name';
has_rw 'indent';

sub render {
    my( $self, $context, $partials ) = @_;

    my $partial;

    if ( ref $partials eq 'CODE' ) {
        my $template = $partials->($self->name)
            or return '';

        $partial = Template::Mustache->new( template => $template )->parsed;
    }
    else {
        $partial = $partials->{$self->name} or return '';
    }

    return $partial->render( $context, $partials, $self->indent );
}

1;

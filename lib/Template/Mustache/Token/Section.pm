package Template::Mustache::Token::Section;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'variable';
has_ro 'template';
has_ro 'inverse';

sub render {
    my( $self, $context, $partials ) = @_;

    my $cond = Template::Mustache::resolve_context( $self->variable, $context );

    if ( $self->inverse ) {
        if ( ref $cond eq 'ARRAY' ) {
            $cond = ! @$cond;
        }else {
        $cond = !$cond;
    }
    }

    return unless $cond;

    return join '', map { $self->template->render( [ $_, @$context ], $partials ) }
        ref $cond eq 'ARRAY' ? @$cond : ( $cond );
}

1;

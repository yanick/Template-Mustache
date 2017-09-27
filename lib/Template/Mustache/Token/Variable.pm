package Template::Mustache::Token::Variable;
# ABSTRACT: Object representing a Variable block

use Escape::Houdini qw/ escape_html /;
use Scalar::Util qw/ looks_like_number /;

use Moo;

use MooseX::MungeHas { 
    has_ro => [ 'is_ro' ] ,
    has_rw => [ 'is_rw' ] ,
};

has_ro 'name';

has escape => (
    is => 'rw',
    lazy => 1, default => sub { 1 },
    predicate => 1,
);

sub render {
    my( $self, $context,$partials, $indent ) = @_;

    my $value = 
        Template::Mustache::resolve_context( $self->name, $context ) // '';

    if( ref $value eq 'CODE' ) {
        $value = $value->(
            sub { Template::Mustache->new( template=> shift )->parsed->render( $context, $partials, $indent )  }
        );
        my $template = Template::Mustache->new( template => $value )->parsed;
        $template->escape($self->escape);
        $value = $template->render(
            $context, $partials, $indent
        );
    }

    eval { $value = escape_html($value) } if $self->escape;

    $value += 0 if looks_like_number($value);

    return $value;
}

1;

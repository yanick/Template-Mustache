;
package Template::Mustache::Token::Variable;

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

use Escape::Houdini qw/ escape_html /;
use Scalar::Util qw/ looks_like_number /;

sub render {
    my( $self, $context,$partials, $indent ) = @_;

    my $value = 
        Template::Mustache::resolve_context( $self->name, $context ) // '';

    if( ref $value eq 'CODE' ) {
        my $template = Template::Mustache->new->compile( $value->() );
        $template->escape($self->escape);
        use Data::Dumper;
        $template->render(
            $context, $partials, $indent
        );
        warn Dumper($template);
        $value = $template->render(
            $context, $partials, $indent
        );
    }

    $value = escape_html($value) if $self->escape;

    $value += 0 if looks_like_number($value);

    return $value;
}

1;

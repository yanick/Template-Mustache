;
package Template::Mustache::Token::Variable;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'name';
has_ro escape => sub { 1 };

use Escape::Houdini qw/ escape_html /;

sub render {
    my( $self, $context ) = @_;

    my $value = 
        Template::Mustache::resolve_context( $self->name, $context ) // '';

    $value = escape_html($value) if $self->escape;

    return $value;
}

1;

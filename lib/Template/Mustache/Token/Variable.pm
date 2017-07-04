package Template::Mustache::Token::Variable;
our $AUTHORITY = 'cpan:YANICK';
$Template::Mustache::Token::Variable::VERSION = '1.0.2';
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

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Token::Variable

=head1 VERSION

version 1.0.2

=head1 AUTHORS

=over 4

=item *

Pieter van de Bruggen <pvande@cpan.org>

=item *

Yanick Champoux <yanick@cpan.org>

=item *

Ricardo Signes <rjbs@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Pieter van de Bruggen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

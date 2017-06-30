package Template::Mustache::Token::Partial;
our $AUTHORITY = 'cpan:YANICK';
$Template::Mustache::Token::Partial::VERSION = '1.0.1_0'; # TRIAL

$Template::Mustache::Token::Partial::VERSION = '1.0.10';use Moo;

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

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Token::Partial

=head1 VERSION

version 1.0.1_0

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

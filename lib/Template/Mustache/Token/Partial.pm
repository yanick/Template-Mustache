package Template::Mustache::Token::Partial;
our $AUTHORITY = 'cpan:YANICK';
# ABSTRACT: Object representing a Partial block
$Template::Mustache::Token::Partial::VERSION = '1.3.4';
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

        $partial = ref $template ? $template : Template::Mustache->new( template => $template )->parsed;
    }
    else {
        $partial = $partials->{$self->name} or return '';
    }

    if( ref $partial eq 'Template::Mustache' ) {
        $partials = $partial->partials;
        $partial = $partial->parsed;
    }

    return $partial->render( $context, $partials, $self->indent );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Token::Partial - Object representing a Partial block

=head1 VERSION

version 1.3.4

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

This software is copyright (c) 2021, 2019, 2018, 2017, 2016, 2015, 2011 by Pieter van de Bruggen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

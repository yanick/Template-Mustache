package Template::Mustache::Token::Template;
our $AUTHORITY = 'cpan:YANICK';
$Template::Mustache::Token::Template::VERSION = '1.0.0_0'; # TRIAL

$Template::Mustache::Token::Template::VERSION = '1.0.00';use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'items';

has escape => (
    is => 'rw',
    lazy => 1, default => sub { 1 },
    predicate => 1,
);

sub flatten {
    return map { ref $_ eq 'ARRAY' ? flatten(@$_) : $_ } grep { ref } @_;
}

sub render {
    my( $self, $context, $partials, $indent ) = @_;

    my @nodes = grep { ref $_ ne 'Template::Mustache::Token::Verbatim' or
        length $_->content } flatten( @{ $self->items } );

    $_->can('has_escape') and ( $_->has_escape or $_->escape($self->escape) )
        for @nodes;

    if( @nodes and ref $nodes[-1] eq 'Template::Mustache::Token::Verbatim' ) {
        $nodes[-1]->last(1);
    }

    return join '', map { $_->render($context, $partials, $indent ) } @nodes;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Token::Template

=head1 VERSION

version 1.0.0_0

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

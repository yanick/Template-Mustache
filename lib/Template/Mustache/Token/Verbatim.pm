package Template::Mustache::Token::Verbatim;
our $AUTHORITY = 'cpan:YANICK';
# ABSTRACT: Object representing a Verbatim block
$Template::Mustache::Token::Verbatim::VERSION = '1.2.0';
use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ], has_rw => [ 'is_rw' ] };

has_ro 'content';
has_rw 'last';

sub render {
    my( $self, undef, undef, $indent ) = @_;
    
    my $value = $self->content;

    if( length $indent ) {
        if ( $self->last ) {
            $value =~ s/(\r?\n)/$1$indent/gm;
            $value =~ s/(\r?\n)$indent$/$1/;
        }
        else {
            $value =~ s/(\r?\n)/$1$indent/gm;
        }
    }

    return $value;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Token::Verbatim - Object representing a Verbatim block

=head1 VERSION

version 1.2.0

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

This software is copyright (c) 2017, 2016, 2015, 2011 by Pieter van de Bruggen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

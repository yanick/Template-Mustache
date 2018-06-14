package Template::Mustache::Token::Section;
our $AUTHORITY = 'cpan:YANICK';
# ABSTRACT: Object representing a Section block
$Template::Mustache::Token::Section::VERSION = '1.3.0';
use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'variable';
has_ro 'template';
has_ro 'inverse';
has_ro 'delimiters';
has_ro 'raw';

use Template::Mustache;

sub render {
    my( $self, $context, $partials, $indent ) = @_;

    my $cond = Template::Mustache::resolve_context( $self->variable, $context );

    if ( ref $cond eq 'CODE' ) {
        my $value=Template::Mustache->new( 
            delimiters => $self->delimiters,
            template => $cond->(
                $self->raw, 
                sub { 
                    Template::Mustache->new( template=> shift )->parsed->render( 
                        $context, $partials, $indent 
                    )  }
            ) 
        )->parsed->render( $context, $partials );

        return '' if $self->inverse;
        return $value;
    }

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

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Token::Section - Object representing a Section block

=head1 VERSION

version 1.3.0

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

This software is copyright (c) 2018, 2017, 2016, 2015, 2011 by Pieter van de Bruggen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

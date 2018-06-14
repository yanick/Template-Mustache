package Template::Mustache::Trait;
our $AUTHORITY = 'cpan:YANICK';
# ABSTRACT: turn an attribute into a Mustache template
$Template::Mustache::Trait::VERSION = '1.3.0';

use Moose::Role;

use Template::Mustache;
use Carp;

before _process_options => sub {
    my( $class, $name, $options ) = @_;

    my $default = $options->{default} or return;

    $options->{default} = sub {
        my $self = shift;
        Template::Mustache->new(
            template => ref $default ? $default->($self) : $default,
            context => $self 
        );
    };
};

package Moose::Meta::Attribute::Custom::Trait::Mustache;
our $AUTHORITY = 'cpan:YANICK';
$Moose::Meta::Attribute::Custom::Trait::Mustache::VERSION = '1.3.0';
sub register_implementation { 'Template::Mustache::Trait' }

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Trait - turn an attribute into a Mustache template

=head1 VERSION

version 1.3.0

=head1 SYNOPSIS

    package Foo;

    use Moose;
    use Template::Mustache::Trait;

    has greet => (
        is => 'ro',
        traits => [ 'Mustache' ],
        default => 'Hello {{ name }}',
        lazy => 1,
        handles => { greeting => 'render' },
    );

    has bye => (
        is => 'ro',
        traits => [ 'Mustache' ],
        default => 'Bye {{ name }}',
        lazy => 1,
        handles => { see_ya => 'render' },
    );

    has name => (
        is => 'rw',
        default => 'world'
    );

    # ... later on ...

    say Foo->new->greet;  # => Hello world

=head1 DESCRIPTION

This trait expects the default value to be either a Mustache template string
or a function returning a template string. It will turns this template
into a L<Template::Mustache> object using the parent object as its context. I.e.,

    has greet => (
        is => 'ro',
        traits => [ 'Mustache' ],
        default => 'Hello {{ name }}',
        lazy => 1,
        handles => { greeting => 'render' },
    );

    # equivalent to

    has greet => (
        is => 'ro',
        default => sub { 
            my $self = shift;
            
            return Template::Mustache->new(
                template=> 'Hello {{ name }}',
                context => $self
            );
        },
        lazy => 1,
        handles => { greeting => 'render' },
    );

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

package Template::Mustache::Context;

use List::Util qw/ first /;

use namespace::clean;

sub new
{
    my ($class, $initial) = @_;
    return bless { stack => [ defined $initial ? $initial : () ] }, $class;
}

sub get
{
    my ($self, $name) = @_;

    for my $frame (@{$self->{stack}}) {
        return $frame->$name() if UNIVERSAL::can($frame, $name);
        return $frame->{$name} if ref $frame eq 'HASH' && exists $frame->{$name};
    }

    return '';
}

sub set
{
    my ($self, %hash) = @_;
    $self->push({ %hash });
}

sub push
{
    my ($self, $ctx) = @_;
    unshift @{$self->{stack}}, $ctx;
}

sub pop
{
    my ($self) = @_;
    shift @{$self->{stack}};
}

sub partial
{
    my ($self, $name) = @_;
    my $mustache = first {
        UNIVERSAL::isa($_, 'Template::Mustache');
    } @{$self->{stack}};

    return $mustache->render($mustache->partial($name), $self);
}

1;
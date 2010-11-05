# This class encapsulates the context stack used in rendering Mustache
# templates.
#
# @api private
package Template::Mustache::Context;

use List::Util qw/ first /;

use namespace::clean;

# Creates a new context stack, preloaded with the optional +$initial+ frame.
# @param $initial [Hash|Class|Object] The initial stack frame.  Optional.
sub new
{
    my ($class, $initial) = @_;
    return bless {
        stack => [ defined $initial ? $initial : () ],
        frame => undef,
    }, $class;
}

# The frame most recently used in a {#get} call.
# @attr accessor
sub frame
{
    my ($self) = @_;
    return $self->{frame};
}

# Walks the context stack, top to bottom, looking for a frame containing data
# for the given +$name+.
# @param $name [String] The name to lookup.
# @returns [String] The stringified result, or the empty string if undef.
sub get
{
    my ($self, $name) = @_;

    $self->{frame} = undef;

    for my $frame (@{$self->{stack}}) {
        if (UNIVERSAL::can($frame, $name)) {
            my $result = $frame->$name();
            $self->{frame} = $frame;
            return defined $result ? $result : '';
        } elsif (ref $frame eq 'HASH' && exists $frame->{$name}) {
            my $result = $frame->{$name};
            $self->{frame} = $frame;
            return defined $result ? $result : '';
        }
    }

    return '';
}

# Pushes the given key/value pairs onto the stack as a new frame.
# @param %hash New context data.
sub set
{
    my ($self, %hash) = @_;
    unshift @{$self->{stack}}, { %hash };
}

# Pushes the given context object onto the hash.  Hash references will be
# cloned first, for isolation.
# @param $ctx [Hash|Class|Object] The new context object.
sub push
{
    my ($self, $ctx) = @_;
    $ctx = { %$ctx } if ref $ctx eq 'HASH';
    unshift @{$self->{stack}}, $ctx;
}

# Removes the topmost object from the context stack.
sub pop
{
    my ($self) = @_;
    shift @{$self->{stack}};
}

# Calls the {Template::Mustache#partial} method on the topmost subclass of
# Template::Mustache on the stack.  The rendered partial is then indented as
# appropriate, and returned.
# @param $name [String] The name of the partial to render.
# @param $padding [String] The leading whitespace to prepend.
# @return [String] The rendered partial.
sub partial
{
    my ($self, $name, $padding) = @_;
    my $mustache = first {
        UNIVERSAL::isa($_, 'Template::Mustache');
    } @{$self->{stack}};

    my $partial = $mustache->render($mustache->partial($name), $self);
    $partial =~ s/^/$padding/gm;
    return $partial;
}

1;
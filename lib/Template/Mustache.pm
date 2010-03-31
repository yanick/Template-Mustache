package Template::Mustache;

use strict;

use aliased 'Template::Mustache::Context';
use aliased 'Template::Mustache::Template';

use File::Slurp qw/ slurp /;
use File::Spec::Functions qw/ catfile rel2abs /;
use MRO::Compat ();
use Try::Tiny;

my $CONFIG = {
    namespace          => '',
    template_path      => '.',
    template_extension => 'mustache',
    template_name      => \&default_template_name,
    template_file      => \&default_template_file,
    template           => \&default_template,
};

my $ASSIGN_HOOKS = {
    template_path      => sub { reset_template(shift); rel2abs(shift) },
    namespace          => \&reset_template,
    template_extension => \&reset_template,
    template_name      => \&reset_template,
    template_file      => \&reset_template,
    template           => \&templateify,
};

sub default_template_name
{
    my ($receiver) = @_;

    my $namespace = $receiver->CONFIG('namespace') || '';
    (my $class = ref $receiver || $receiver) =~ s/^${namespace}:://;

    return catfile(split('::', $class));
}

sub default_template_file
{
    my ($receiver) = @_;

    my $path      = $receiver->CONFIG('template_path');
    my $name      = $receiver->CONFIG('template_name');
    my $extension = $receiver->CONFIG('template_extension');

    return catfile($path, "$name.$extension");
}

sub default_template
{
    my ($receiver) = @_;
    my $template = slurp($receiver->CONFIG('template_file'));

    return $receiver->CONFIG(template => Template->new($template));
}

sub reset_template
{
    my ($receiver, $value) = @_;

    delete $receiver->{template} if ref $receiver;
    delete $CONFIG->{"$receiver#template"};

    return $value;
}

sub templateify
{
    my $template = $_[-1];

    if (UNIVERSAL::isa($template, Template)) {
        return $template;
    } else {
        return Template->new($template);
    }
}

sub get
{
    my ($obj, $key) = @_;

    if (my $class = ref $obj) {
        return $obj->{$key} if exists $obj->{$key};
        return get($class, $key);
    } else {
        return $CONFIG->{"$obj#$key"} if exists $CONFIG->{"$obj#$key"};
        if (ref(my $value = $CONFIG->{$key}) eq 'CODE') {
            return $obj->$value();
        } else {
            return set($obj, $key => $value);
        }
    }
}

sub set
{
    my ($obj, $key, $value) = @_;
    my $hash = $obj;
    my $hook = $ASSIGN_HOOKS->{$key};

    unless (ref $obj) {
        $key = "$obj#$key";
        $hash = $CONFIG;
    }

    $hash->{$key} = $hook ? $obj->$hook($value) : $value;
    return $hash->{$key};
}

use namespace::clean;

sub new
{
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub context
{
    my ($self) = @_;
    $self->{context} ||= Context->new($self);
}

sub partial
{
    my ($self, $name) = @_;
    my $path      = $self->CONFIG('template_path');
    my $extension = $self->CONFIG('template_extension');
    return scalar slurp(catfile($path, "$name.$extension"));
}

sub is_compiled
{
    my ($receiver) = @_;
    my $class = ref $receiver || $receiver;

    return 1 if ref $receiver && exists $receiver->{template};
    return exists $CONFIG->{"$class#template"};
}

sub render
{
    my ($receiver, $tmpl, $ctx) = @_;
    my $self = ref $receiver ? $receiver : $receiver->new();
    my $context = $self->context;

    $tmpl = defined $tmpl ? templateify($tmpl) : $receiver->CONFIG('template');
    return $tmpl->render($context) unless $ctx;

    try {
        $context->push($ctx);
        return $tmpl->render($context);
    } finally {
        $context->pop();
    }
}

sub CONFIG
{
    my $sentinel = "__@{[time, '__SENTINEL__', time]}__";
    my ($receiver, $key, $val) = (@_, $sentinel, $sentinel);

    return $CONFIG if $key eq $sentinel;
    return set($receiver, $key, $val) unless ($val && $val eq $sentinel);
    return get($receiver, $key);
}

1;
# Drawing Mustaches on Perl, for fun and profit.
#
# Template::Mustache is a Perl implementaiton of the Mustache templating
# language, providing easy-to-read (and write) logic-free string templating.
# For a full list of implementations, see http://mustache.github.com.
#
# Instead of a single file with embedded Perl code, as found in Mason and
# other common templating systems, Template::Mustache breaks the job apart
# into two distinct parts -- a _view_, representing the data to be rendered,
# and a _template_, representing the form that rendered data will take. All
# logic, decisions, and other code end up contained entirely within your view,
# while the template simply interpolates the data.
#
# This separation of concerns means that working on the frontend of your
# application can be fun -- your templates are just text, and your views are
# just code.
#
# == Usage
#
# As simple as it gets:
#
#     use Template::Mustache;
#     print Template::Mustache->render("Hi, {{parent}}!", {parent => "mom"});
#     # => "Hi, mom!"
#
# As for the canonical Mustache example, here it is:
#
#     package Simple;
#     use base 'Template::Mustache';
#
#     sub name { "Chris" }
#     sub value { 10_000 }
#     sub in_ca { 1 }
#     sub taxed_value {
#         my ($self) = @_;
#         return $self->value() - ($self->value() * 0.4)
#     }
#
# Which, given the template
#
#     Hello {{name}}
#     You have just won ${{value}}!
#     {{#in_ca}}
#     Well, ${{taxed_value}}, after taxes.
#     {{/in_ca}}
#
# As you can see, the template elements reference the view methods. To join
# it all together, a call to
#
#     Simple->render();
#
# Will return the string
#
#     Hello Chris
#     You have just won $10000!
#     
#     Well, $6000 after taxes.
#     
#
# == Tag Types
#
# Tags are the fundamental units of a Mustache template, and are denoted by a
# matched pair of curly braces (or "mustaches").  There are a number of
# different types of tags ({the docs}[http://mustache.github.com/mustache.5.html]
# can tell you more), but here are a few of the basic types.
#
# === Variables
#
# The most basic -- and most useful -- tag is the variable.  A <tt>{{name}}</tt>
# tag in your template will try to find the *name* key or method on your view.
# If there's no *name* method, nothing gets rendered.
#
# Variables are HTML escaped by default, which is fairly convenient for when
# you're building strings of HTML text.  To get at the unescaped content, use
# the triple mustache form: <tt>{{{name}}}</tt>.
#
# While the triple mustache is the preferred way of getting at the unescaped
# value, there may be cases where it's unsuitable or unwieldy; the <tt>&</tt>
# can be used in those cases as another way to get the raw content:
# <tt>{{&name}}</tt>.
#
# === Sections
#
# Sections are used to repeat a part of the template.  With a couple special
# cases, they can be thought of as a kind of a 'for' loop, iterating over the
# array reference returned by the referenced tag.
#
# A section begins with a pound and ends with a slash.  That is,
# <tt>{{#person}}</tt> begins a "person" section while <tt>{{/person}}</tt>
# ends it.
#
# As mentioned, if the *person* key holds an array reference, the section will
# be output once for each member of the array.  Each element will also be
# pushed onto the context stack as it is visited, so for the duration of the
# section, tag lookups will resolve against the array element _first_ (before
# falling back to outer scopes).  Any hash reference, object, or package name
# can be used as a meaningful context provider -- unblessed hash references
# will be tested with an +exists+ check, while objects and packages will be
# subjected to a +can+ query.
#
# In the event the *person* key holds a truthy value other than an array ref,
# the value is assumed to be the sole value for iteration; the section will be
# output, and the element will be pushed onto the context stack for the
# duration of the section.
#
# However, in the event the *person* key does not exist or holds a falsey
# value, the section  <em>will not</em> be output.  Given these last two rules,
# sections can easily be used as a simple 'if' statement.
#
# === Inverted Sections
#
# Of course, having an 'if' demands an 'unless' to a Perl Hacker, and the
# Mustache specification provides.  An inverted section begins with a caret
# (hat) and ends with a slash.  That is, <tt>{{^person}}</tt> begins a "person"
# inverted section, and <tt>{{/person}}</tt> closes it.  As expected, inverted
# sections will be output whenever a regular section wouldn't (failed lookup,
# falsey value, or an empty array reference).
#
# === Comments
#
# Comments begin with a bang, and are ignored.  They look like this:
#
#     {{! this is a comment }}
#
# === Partials
#
# Partials begin with a greater than sign, like <tt>{{> box}}</tt>, and include
# additional content in your template at runtime.  Partials also have full
# access to the curent context stack, and may include other partials --
# including themselves, so recursion is possible.
#
# For information about how partial names are resolved, see Context#partial.
#
# === Set Delimiter
#
# In certain contexts, working with the <tt>{{</tt> and <tt>}}</tt> delimiters
# can actually be a bit trying (we're looking at you, TeX).  The Set Delimiter
# tag type is surrounded by equals signs, and contains a two element (whitespace
# separated) list that will be used as replacements for the opening and
# closing braces.
#
# Consider the following example:
#
#     * {{default}}
#     {{=<% %>=}}
#     * <%mason%>
#     <%={{ }}=%>
#     * {{default}}
#
# Custom delimiters may not contain whitespace, the equals sign, or nuts.
#
# == Templates
#
# By default, a Mustache view will look for a template file with a 'mustache'
# extension on disk in the current directory.
#
#      MyMustache->CONFIG('template_file'); # => './MyMustache.mustache'
#
# The +template_path+ CONFIG option will alter the search path, so that
# templates will be read from an alternate location.
#
#      MyMustache->CONFIG(template_path => 'templates');
#      MyMustache->CONFIG('template_file'); # => './templates/MyMustache.mustache'
#
# Of course, if you'd like to just change the template file outright, the
# +template_file+ option was provided for just such a convenience.
#
# Namespaced classes are looked up in a directory heirarchy matching the given
# namespace (just like Perl modules).
#
#     My::Mustache->CONFIG('template_file'); # => './My/Mustache.mustache'
#
# If your view is deeply nested in a namespace, you might consider using the
# +namespace+ CONFIG option to reduce the number of superfluous directories
# you search through.
#
#     My::Nested::Mustache->CONFIG(namespace => 'My::Nested');
#     My::Nested::Mustache->CONFIG('template_file'); # => './Mustache.mustache'
#
# The +template_name+ and +template_extension+ options do what you probably
# expect them to.  If, however, none of these options give you the flexibility
# you need for your use case, you can always assign the +template+ yourself.
#
#     MyMustache->CONFIG(template => 'Hello, {{planet}}!');
#
# @see http://mustache.github.com
# @author Pieter Vande Bruggen <pvande@cpan.org>
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

# Creates a new instance of the class.
# @return [Mustache] The new instance.
sub new
{
    my ($class, %args) = @_;
    return bless \%args, $class;
}

# Returns the current context stack.
# @return [Context] The current context.
sub context
{
    my ($self) = @_;
    return $self->{context} ||= Context->new($self);
}

# Returns a the template string for the requested partial.
# @param $name [String] The requested partial name.
# @return [String] The partial's template string.
sub partial
{
    my ($self, $name) = @_;
    my $path      = $self->CONFIG('template_path');
    my $extension = $self->CONFIG('template_extension');
    return scalar slurp(catfile($path, "$name.$extension"));
}

# Provides a convenient hook for determining the compilation state of this
# view.
# @return [Boolean] Returns true if the template for the receiver has already
#   been compiled.
sub is_compiled
{
    my ($receiver) = @_;
    my $class = ref $receiver || $receiver;

    return 1 if ref $receiver && exists $receiver->{template};
    return exists $CONFIG->{"$class#template"};
}

# Renders the view, either reading the template from the +CONFIG+, or using
# the template supplied.  The optional context supplied will be pushed onto
# the results from {#context}.
#
# @param [String,Template] $tmpl The template to render.  Defaults to the
#   +template+ in the +CONFIG+.
# @param [Hash,Class,Object] $ctx Additional context for the template.
#   Optional.
# @return [String] The fully rendered template.
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

# Allows for inhertiable per-class (and per-instance) configuration options.
#
# @scope dual
# @overload CONFIG($receiver, $key)
#   Read the named configuration option.
#   @param [String] $key
#   @return [String,Template] The named configuration option's value.
# @overload CONFIG($reciever, %options)
#   Set the named configuration option.
#   @option %options [String] namespace ('')
#     The leading portion of the package's name to ignore.  Used by
#     +template_name+.
#   @option %options [String] template_path ('.')
#     Specifies where to begin searching for the +template_file+.
#   @option %options [String] template_extension ('mustache')
#     Specifies the file extension for Mustache templates.
#   @option %options [String] template_name ($class =~ s/::/\//)
#     Specifies the name of the template file, sans extension.  Defaults to
#     the class name, leading +namespace+ removed.
#   @option %options [String] template_file ("$path/$name.$extension")
#     Specifies the template file to use.  Unifies +template_path+,
#     +template_name+, and +template_extension+ into a single file path by
#     default.
#   @option %options [String,Template] template (File::Slurp::slurp($template_file))
#     The cached template used to render this view.
#   @return [String,Template] The new value for the option.
sub CONFIG
{
    my ($receiver, $key, $val) = @_;

    if (@_ == 1) {
        return $CONFIG;
    } elsif (@_ == 2) {
        return get($receiver, $key);
    } elsif (@_ == 3) {
        return set($receiver, $key, $val)
    }
}

1;
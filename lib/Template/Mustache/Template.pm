# {Template} is the object wrapper for a Mustache template.  This class
# handles parsing, compiling, and caching the raw template, as well as the
# basics of rendering it.
#
# Odds are, you don't have a good reason to use this class directly.  See
# {Mustache.render Mustache->render} instead.
package Template::Mustache::Template;

use strict;

use Template::Mustache::Parser    qw/ parse /;
use Template::Mustache::Generator qw/ build /;

use namespace::clean;

# Creates a new {Template} instance.
# @param $source [String] The template represented by this object.
# @return [Template]
sub new
{
    my ($class, $source) = @_;
    return bless { source => ($source || '') }, __PACKAGE__;
}

# Compiles the template down its basic string operations and renders the
# output using the given +$context+.  Subsequent calls to {#render} will not
# require recompilation.
# @param $context [Context] A context stack, representing the data to be
#   interpolated into the template.
# @return [String]
sub render
{
    my ($self, $context) = @_;
    my $src = build(parse($self->{source}));

    {
        no strict 'refs';
        my $class = join('::', ref $self, '__SINGLETON__', $self + 0);

        eval qq/
            package $class;
            our \@ISA = qw(@{[ ref $self ]});

            sub render
            {
                my (\$self, \$ctx) = \@_;
                my \$v = undef;
                return ($src);
            }

            sub DESTROY
            {
                undef %{'${class}::'};
            }
        /;

        bless $self, $class;
    }

    return $self->render($context);
}

1;

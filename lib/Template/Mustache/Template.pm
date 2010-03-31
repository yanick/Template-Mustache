package Template::Mustache::Template;

use strict;

use Template::Mustache::Parser    qw/ parse /;
use Template::Mustache::Generator qw/ build /;

sub new
{
    my ($class, $source) = @_;
    return bless { source => ($source || '') }, __PACKAGE__;
}

my $SERIAL = 0;
sub render
{
    my ($self, $context) = @_;
    my $src = build(parse($self->{source}));

    {
        no strict 'refs';
        my $class = join('::', ref $self, '__SINGLETON__', $SERIAL++);

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

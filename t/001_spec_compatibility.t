use Test::Mini;

use File::Basename        qw/ basename dirname /;
use File::Spec::Functions qw/ catfile /;
use Template::Mustache;
use YAML::Syck ();
$YAML::Syck::ImplicitTyping = 1;

my $specs = catfile(dirname(__FILE__), '..', 'ext', 'spec', 'specs');
for my $file (glob catfile($specs, '*.yml')) {
    my $spec = YAML::Syck::LoadFile($file);
    ($file = basename($file)) =~ s/[^\w.]//g;

    no strict 'refs';
    @{"$file\::ISA"} = 'MustacheSpec';

    for my $test (@{$spec->{tests}}) {
        (my $name = $test->{name}) =~ s/'/"/g;

        *{"$file\::test - @{[$name]}"} = sub {
            my ($self) = @_;
            $self->setup_data($test);
            $self->assert_mustache_spec($test);
        };
    }
}

{
    package MustacheSpec;
    use base 'Test::Mini::TestCase';
    use Test::Mini::Assertions;

    sub setup_data {
        my ($self, $test) = @_;

        while (my ($key, $value) = each %{$test->{data}}) {
            if (ref $value eq 'code') {
                $test->{data}->{$key} = eval $value->{perl};
            } elsif (ref $value eq 'HASH') {
                $self->setup_data({ data => $value });
            }
        }
    }

    sub assert_mustache_spec {
        my ($self, $test) = @_;

        use Data::Dumper;
        $Data::Dumper::Terse = 1;
        $Data::Dumper::Useqq = 1;
        $Data::Dumper::Quotekeys = 0;
        $Data::Dumper::Indent = 0;
        $Data::Dumper::Sortkeys = 1;
        $Data::Dumper::Deparse = 1;

        my $expected = $test->{expected};
        my $tmpl = $test->{template};
        my $data = $test->{data};
        my $partials = $test->{partials};

        my $actual = Template::Mustache->render($tmpl, $data, $partials);

        assert_equal($actual, $expected,
            "$test->{desc}\n".
            "Data:     @{[ Dumper $test->{data} ]}\n".
            "Template: @{[ Dumper $test->{template} ]}\n".
            "Partials: @{[ Dumper ($test->{partials} || {}) ]}\n"
        );
    }
}

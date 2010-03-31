use Benchmark   qw/ :hireswallclock timethese /;
use File::Slurp qw/ slurp /;

require 'fixtures/ComplexView.pm';

my $content = slurp('fixtures/ComplexView.mustache');

my $tmpl = ComplexView->new();
$tmpl->CONFIG('template');

my $items = [
    { name => 'red',   current => 1, url => '#Red' },
    { name => 'green', current => 0, url => '#Green' },
    { name => 'blue',  current => 0, url => '#Blue' },
];

$tmpl->context->set(
    header => 'Chris',
    empty  => 0,
    list   => 1,
    item   => $items,
);

timethese(5000, {
    '{{   w/ caching' => sub { $tmpl->render(); },
    '{{  w/o caching' => sub {
        my $t = ComplexView->new();
        $t->CONFIG(template => $content);
        $t->context->set(item => $items);
        $t->render();
    },
});
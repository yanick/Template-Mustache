package Template::Mustache::Generator;

use strict;
use base 'Exporter';

use CGI ();
use Data::Dumper ();

our @EXPORT_OK = qw/ build /;

sub inspect
{
    my $dumper = Data::Dumper->new([@_]);
    $dumper->Terse(1);
    $dumper->Useqq(1);

    return trim($dumper->Dump());
}

sub trim
{
    my ($string) = @_;
    $string =~ s/^ \s* | \s* $//mgx;
    return $string;
}

sub evalable
{
    return qq'(@_)'
}

sub call
{
    my ($name, @args) = @_;
    $Template::Mustache::Generator::{$name}->(@args);
}

use namespace::clean;

sub text
{
    my $string = inspect(@_);
    return $string;
}

sub etag
{
    return evalable("escapeHTML(@{[ utag(@_) ]})");
}

sub utag
{
    my $name = inspect(@_);
    my $value  = "\$v = \$ctx->get($name)";
    my $frame  = '$ctx->frame';
    my $deref  = '$v = eval(build(parse(&$v)))';
    my $update = "$deref; ${frame}->{$name} = \$v if ref $frame eq 'HASH'";
    my $v      = "do { ref($value) eq 'CODE' && do { $update }; \$v }";
    return evalable($v);
}

sub partial
{
    my $name = inspect(shift);
    my $indent = inspect(shift);
    return evalable("\$ctx->partial($name, $indent)");
}

sub block
{
    my @parts = map { call(@$_) } @_;
    return join(' . ', @parts);
}

sub section
{
    my ($name, $block) = @_;
    my $str = pop(@$block);
    $name = inspect($name);
    my $content = build($block);

    my $value = "\$v = \$ctx->get($name)";
    my $map   = '$ctx->push($_); $v = ' . $content . '; $ctx->pop(); $v';
    my $CODE  = 'eval(build(parse(&$v(' . inspect($str) . '))))';
    my $ELSE  = 'map { ' . $map . ' } @{ref $v eq "ARRAY" ? $v : [$v || ()]}';

    return evalable("ref($value) eq 'CODE' ? $CODE : join('', $ELSE)");
}

sub inverted
{
    my ($name, $block) = @_;
    $name = inspect($name);

    pop(@$block);
    my $content = build($block);

    my $value = "\$v = \$ctx->get($name)";
    my $v     = '@{ref(' . $value . ') eq "ARRAY" ? $v : [$v || ()]}';
    my $block = '$ctx->push($_); $v = ' . $content . '; $ctx->pop(); $v';

    return evalable("$v ? '' : do { $block }");
}

sub build
{
    my ($block) = @_;
    return qq'@{[ call(@$block) ]}'
}

1;
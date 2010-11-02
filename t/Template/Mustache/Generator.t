use Test::Mini::Unit;

use Template::Mustache::Context;
use Template::Mustache::Generator;
use Template::Mustache::Parser;

case t::Template::Mustache::Generator
{
    use CGI 'escapeHTML';
    sub build { Template::Mustache::Generator::build(@_) }
    sub parse { Template::Mustache::Parser::parse(@_)    }

    sub assert_tag {
        my ($self, $tag_name, $data, $tmpl, $expected, $count) = @_;
        my ($v, $ctx) = (undef, Template::Mustache::Context->new($data));

        no strict 'refs';
        my $tag = $Template::Mustache::Generator::{$tag_name};
        assert_equal(eval($tag->($tmpl)),$expected) for (0..($count || 1));
    }

    case LiteralText {
        sub assert_tag { shift->SUPER::assert_tag('text', @_) }

        test text {
            $self->assert_tag({ }, '"Contains" quotes' => '"Contains" quotes');
        }
    }

    case UnescapedInterpolation {
        sub assert_tag { shift->SUPER::assert_tag('utag', @_) }

        test with_static_value {
            $self->assert_tag({ name => 'Phil'}, 'name' => 'Phil');
        }

        test with_html_special_values {
            $self->assert_tag(
                { special => '< & " >' },
                'special' => '< & " >',
            );
        }

        test with_lambda {
            $self->assert_tag(
                { lambda => sub { 'coderef' } },
                'lambda' => 'coderef',
            );
        }

        test with_multiple_lambda_calls {
            my $count = 0;
            $self->assert_tag(
                { lambda => sub { $count += 1 } },
                'lambda' => '1',
                3, #times
            );
        }

        test with_mustache_tags {
            $self->assert_tag(
                { foo => 'bar', lambda => sub { 're{{{foo}}}' } },
                'lambda' => 'rebar',
            );
        }
    }

    case EscapedInterpolation {
        sub assert_tag { shift->SUPER::assert_tag('etag', @_) }

        test with_static_value {
            $self->assert_tag({ name => 'Phil'}, 'name' => 'Phil');
        }

        test with_html_special_values {
            $self->assert_tag(
                { special => '< & " >' },
                'special' => '&lt; &amp; &quot; &gt;',
            );
        }

        test with_lambda {
            $self->assert_tag(
                { lambda => sub { 'coderef' } },
                'lambda' => 'coderef',
            );
        }

        test with_multiple_lambda_calls {
            my $count = 0;
            $self->assert_tag(
                { lambda => sub { $count += 1 } },
                'lambda' => '1',
                3, #times
            );
        }

        test with_mustache_tags {
            $self->assert_tag(
                { foo => 'bar', lambda => sub { 're{{{foo}}}' } },
                'lambda' => 'rebar',
            );
        }
    }

    # test partial
    # {
    #     assert_equal(partial('name', ' '), '($ctx->partial("name", " "))');
    # }
    #
    # test block
    # {
    #     my $block = block(
    #         [ text => 'abc' ],
    #         [ utag => 'name' ],
    #         [ text => 'def' ],
    #     );
    #     assert_equal($block, '"abc" . ($ctx->get("name")) . "def"');
    # }
    #
    # test section
    # {
    #     my $pred = 'defined($v = $ctx->get("name"))';
    #     my $map  = '$ctx->push($_); $v = "content"; $ctx->pop(); $v';
    #     my $list = '@{ref $v eq "ARRAY" ? $v : [$v || ()]}';
    #
    #     assert_equal(
    #         section('name', [ block => [ text => 'content' ] ]),
    #         qq'($pred && join "", map { $map } $list)',
    #     );
    # }
    #
    # test inverted
    # {
    #     my $pred  = 'defined($v = $ctx->get("name"))';
    #     my $block = '$ctx->push($_); $v = "content"; $ctx->pop(); $v';
    #     my $val   = '@{ref $v eq "ARRAY" ? $v : [$v || ()]}';
    #
    #     assert_equal(
    #         inverted('name', [ block => [ text => 'content' ] ]),
    #         qq'($pred && ($val) ? "" : do { $block })',
    #     );
    # }
    #
    # test build
    # {
    #     my $content = '" . (CGI::escapeHTML($ctx->get("content"))) . "';
    #     my $pred = 'defined($v = $ctx->get("name"))';
    #     my $map  = '$ctx->push($_); $v = "-='.$content.'=-"; $ctx->pop(); $v';
    #     my $list = '@{ref $v eq "ARRAY" ? $v : [$v || ()]}';
    #
    #     my $block = build(
    #         [ block => (
    #             [ text => 'pre' ],
    #             [ section => ('name', [
    #                 block => (
    #                     [ text => '-=' ],
    #                     [ etag => 'content' ],
    #                     [ text => '=-' ],
    #                 ),
    #             ]) ],
    #             [ text => 'post' ],
    #         )],
    #     );
    #
    #     assert_equal(
    #         $block,
    #         qq'"pre" . ($pred && join "", map { $map } $list) . "post"',
    #     );
    # }
}
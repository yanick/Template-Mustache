use Test::Mini::Unit;

case t::Template::Mustache::Generator
{
    use Template::Mustache::Generator qw/ build /;

    sub text { Template::Mustache::Generator::text(@_) }
    sub utag { Template::Mustache::Generator::utag(@_) }
    sub etag { Template::Mustache::Generator::etag(@_) }

    sub partial  { Template::Mustache::Generator::partial(@_)  }
    sub block    { Template::Mustache::Generator::block(@_)    }
    sub section  { Template::Mustache::Generator::section(@_)  }
    sub inverted { Template::Mustache::Generator::inverted(@_) }

    test text
    {
        my $text = text('This string "contains" quotes.');
        assert_equal($text, 'This string \"contains\" quotes.');
    }

    test utag
    {
        assert_equal(utag('name'), '".($ctx->get("name"))."');
    }

    test etag
    {
        assert_equal(etag('name'), '".(CGI::escapeHTML($ctx->get("name")))."');
    }

    test partial
    {
        assert_equal(partial('name'), '".($ctx->partial("name"))."');
    }

    test block
    {
        my $block = block(
            [ text => 'abc' ],
            [ utag => 'name' ],
            [ text => 'def' ],
        );
        assert_equal($block, 'abc".($ctx->get("name"))."def');
    }

    test section
    {
        my $pred = 'defined($v = $ctx->get("name"))';
        my $map  = '$ctx->push($_); $v = "content"; $ctx->pop(); $v';
        my $list = '@{ref $v eq "ARRAY" ? $v : [$v || ()]}';

        assert_equal(
            section('name', [ block => [ text => 'content' ] ]),
            qq'".($pred && join "", map { $map } $list)."',
        );
    }

    test inverted
    {
        my $pred = 'defined($v = $ctx->get("name"))';
        my $map  = '$ctx->push($_); $v = "content"; $ctx->pop(); $v';
        my $list = '($v ? () : ($v))';

        assert_equal(
            inverted('name', [ block => [ text => 'content' ] ]),
            qq'".($pred && join "", map { $map } $list)."',
        );
    }

    test build
    {
        my $content = '".(CGI::escapeHTML($ctx->get("content")))."';
        my $pred = 'defined($v = $ctx->get("name"))';
        my $map  = '$ctx->push($_); $v = "-='.$content.'=-"; $ctx->pop(); $v';
        my $list = '@{ref $v eq "ARRAY" ? $v : [$v || ()]}';

        my $block = build(
            [ block => (
                [ text => 'pre' ],
                [ section => ('name', [
                    block => (
                        [ text => '-=' ],
                        [ etag => 'content' ],
                        [ text => '=-' ],
                    ),
                ]) ],
                [ text => 'post' ],
            )],
        );

        assert_equal(
            $block,
            qq'"pre".($pred && join "", map { $map } $list)."post"',
        );
    }
}
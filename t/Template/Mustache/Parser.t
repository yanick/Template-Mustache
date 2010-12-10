use Test::Mini::Unit;

case t::Template::Mustache::Parser
{
    require Template::Mustache::Parser;

    sub assert_parse_tree
    {
        my ($template, $expected) = @_;
        assert_equal(Template::Mustache::Parser::parse($template), $expected);
    }

    test plain_string
    {
        assert_parse_tree(
            '<h1>Welcome</h1>',
            [ block => [ text => '<h1>Welcome</h1>' ] ]
        );
    }

    test escaped_tag_content
    {
        assert_parse_tree(
            '<h1>{{ greeting }}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ etag => 'greeting' ],
                [ text => '</h1>'],
            ) ]
        );
    }

    test triple_mustache_unescaped_tag_content
    {
        assert_parse_tree(
            '<h1>{{{ greeting }}}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ utag => 'greeting' ],
                [ text => '</h1>'],
            ) ]
        );
    }

    test ampersand_unescaped_tag_content
    {
        assert_parse_tree(
            '<h1>{{& greeting }}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ utag => 'greeting' ],
                [ text => '</h1>'],
            ) ]
        );
    }

    test comment_tag
    {
        assert_parse_tree(
            '<h1>{{! Omitted; see http://google.com#newhope }}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ text => '</h1>' ],
            ) ]
        );
    }

    test lt_partial_tag
    {
        assert_parse_tree(
            '<h1>{{< outside}}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ partial => 'outside', '' ],
                [ text => '</h1>' ],
            ) ]
        );
    }

    test gt_partial_tag
    {
        assert_parse_tree(
            '<h1>{{> outside}}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ partial => 'outside', '' ],
                [ text => '</h1>' ],
            ) ]
        );
    }

    test delimiter_redefine
    {
        assert_parse_tree(
            '<h1>{{= . . =}}.a..&b..< c..={{ }}=.{{d}}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ etag => 'a' ],
                [ utag => 'b' ],
                [ partial => 'c', '' ],
                [ etag => 'd' ],
                [ text => '</h1>' ],
            ) ]
        );
    }

    test sections
    {
        assert_parse_tree(
            '<h1>{{# condition }}{{ inside }}{{/ condition }}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ section => ('condition',
                    [ block => ([ etag => 'inside' ]), '{{ inside }}' ],
                ) ],
                [ text => '</h1>' ],
            ) ]
        );
    }

    test inverted_sections
    {
        assert_parse_tree(
            '<h1>{{^ condition }}{{ inside }}{{/ condition }}</h1>',
            [ block => (
                [ text => '<h1>' ],
                [ inverted => ('condition',
                    [ block => ([ etag => 'inside' ]), '{{ inside }}' ],
                ) ],
                [ text => '</h1>' ],
            ) ]
        );
    }

    test empty_tag
    {
        assert_dies(\&$_, 'Illegal tag content') for (
            sub { Template::Mustache::Parser::parse('<h1>{{     }}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{{   }}}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{&    }}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{<    }}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{>    }}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{=   =}}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{= a =}}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{#    }}</h1>') },
            sub { Template::Mustache::Parser::parse('<h1>{{/    }}</h1>') },
        );
    }

    test unclosed_tag
    {
        assert_dies(
            sub { Template::Mustache::Parser::parse('<h1>{{</h1>') },
            'Unclosed tag',
        );
    }

    test unopened_section
    {
        assert_dies(
            sub { Template::Mustache::Parser::parse("<h1>{{/ b }}</h1>") },
            "Closing unopened section 'b'",
        );
    }

    test unclosed_section_after_opened_section
    {
        assert_dies(
            sub { Template::Mustache::Parser::parse('<h1>{{# a }}</h1>') },
            "Unclosed section 'a'",
        );
    }

    test unclosed_section_after_inverted_section
    {
        assert_dies(
            sub { Template::Mustache::Parser::parse('<h1>{{^ a }}</h1>') },
            "Unclosed section 'a'",
        );
    }

    test prematurely_closed_outer_section
    {
        assert_dies(
            sub { Template::Mustache::Parser::parse('<h1>{{# a }}{{# b }}{{/ a }}') },
            "Unclosed section 'b'",
        );
    }
}
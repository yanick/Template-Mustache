use Test::Mini::Unit;
use Template::Mustache;

case t::ParseErrors {
    test closing_the_wrong_section_tag {
        assert_dies(sub {
            Template::Mustache->render("
                Before...
                {{#section}}
                Inner...
                {{/other}}
                After...
            ")
        }, "End Section tag closes 'other'; expected 'section'!");
    }

    test not_closing_a_nested_section_tag {
        assert_dies(sub {
            Template::Mustache->render("
                {{#a}}
                  {{#b}}
                {{/a}}
            ")
        }, "End Section tag closes 'a'; expected 'b'!");
    }

    test closing_a_section_at_the_top_level {
        assert_dies(sub {
            Template::Mustache->render("
                Before...
                {{/section}}
                After...
            ")
        }, "End Section tag 'section' found, but not in a section!");
    }

    test specifying_too_few_delimiters {
        assert_dies(sub {
            Template::Mustache->render('{{= $$$ =}}')
        }, 'Set Delimiters tags must have exactly two values!');
    }

    test specifying_too_many_delimiters {
        assert_dies(sub {
            Template::Mustache->render('{{= $ $ $ =}}')
        }, 'Set Delimiters tags must have exactly two values!');
    }

    test specifying_an_unknown_tag_type {
        assert_dies(sub {
            Template::Mustache->render('{{% something }}')
        }, 'Unknown tag type -- %');
    }
}

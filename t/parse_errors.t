use Test2::V0;
use Test::Exception;

use strict;
use warnings;

use Template::Mustache;

subtest closing_the_wrong_section_tag => sub {
    dies_ok {
        local *STDERR;
        Template::Mustache->render("
            Before...
            {{#section}}
            Inner...
            {{/other}}
            After...
        ")
    } "End Section tag closes 'other'; expected 'section'!";
};

subtest not_closing_a_nested_section_tag => sub {
    dies_ok {
        local *STDERR;
        Template::Mustache->render("
            {{#a}}
                {{#b}}
            {{/a}}
        ")
    };# "End Section tag closes 'a'; expected 'b'!";
};

subtest closing_a_section_at_the_top_level => sub {
    dies_ok {
        local *STDERR;
        Template::Mustache->render("
            Before...
            {{/section}}
            After...
        ")
    };# "End Section tag 'section' found, but not in a section!";
};

subtest delimiters => sub { 
    subtest specifying_too_few_delimiters => sub {
        dies_ok {
            local *STDERR;
            Template::Mustache->render('{{= $$$ =}}')
        } 'Set Delimiters tags must have exactly two values!';
    };

    subtest specifying_too_many_delimiters => sub {
        dies_ok {
            local *STDERR;
            Template::Mustache->render('{{= $ $ $ =}}')
        } 'Set Delimiters tags must have exactly two values!';
    };
};

subtest specifying_an_unknown_tag_type => sub {
    dies_ok {
        local *STDERR;
        Template::Mustache->render('{{% something }}')
    } 'Unknown tag type -- %';
};

done_testing;

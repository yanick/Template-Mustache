use Test::Mini::Unit;

{
    package Greeter;

    sub new {
        my ($class, %args) = @_;
        return bless \%args, $class;
    }

    sub greetee  { shift->{greetee} }
    sub greeting { 'Welcome'        }

    no strict 'refs';
    *{"can_greet?"} = sub { exists shift->{greetee} }
}

testcase Template::Mustache::Template::Test
{
    use aliased 'Template::Mustache::Context';
    use aliased 'Template::Mustache::Template';

    sub assert_renders
    {
        my ($expected, $template, $context) = @_;

        $template = Template->new($template);
        $context  = Context->new($context);

        assert_equal($template->render($context), $expected);
    }

    test plain_string
    {
        assert_renders(
            '<h1>Welcome</h1>',
            '<h1>Welcome</h1>',
        );
    }

    test simple_field_replacement_with_hash
    {
        assert_renders(
            '<h1>Welcome</h1>',
            '<h1>{{ greeting }}</h1>',
            { greeting => 'Welcome' },
        );
    }

    test simple_field_replacement_with_class_name
    {
        assert_renders(
            '<h1>Welcome</h1>',
            '<h1>{{ greeting }}</h1>',
            'Greeter',
        );
    }

    test simple_field_replacement_with_object
    {
        assert_renders(
            '<h1>Welcome</h1>',
            '<h1>{{ greeting }}</h1>',
            Greeter->new(),
        );
    }

    test simple_field_replacement_with_html_content
    {
        assert_renders(
            '<h1>You &amp; Me</h1>',
            '<h1>{{ title }}</h1>',
            { title => 'You & Me' },
        );
    }

    test simple_field_replacement_with_context_miss
    {
        assert_renders(
            '<h1></h1>',
            '<h1>{{ greeting }}</h1>',
            { food => 'pie' },
        );
    }

    test simple_field_replacement_with_an_acontextual_entity
    {
        assert_renders(
            '<h1></h1>',
            '<h1>{{ greeting }}</h1>',
            [],
        );
    }

    test triple_mustache_unescaped_field_replacement
    {
        assert_renders(
            '<h1>You & Me</h1>',
            '<h1>{{{ title }}}</h1>',
            { title => 'You & Me' },
        );
    }

    test ampersand_unsecaped_field_replacement
    {
        assert_renders(
            '<h1>You & Me</h1>',
            '<h1>{{& title }}</h1>',
            { title => 'You & Me' },
        );
    }

    test comment_is_ignored
    {
        assert_renders(
            '<h1></h1>',
            '<h1>{{! greeting }}</h1>',
            { greeting => 'Welcome' },
        );
    }

    test section_replacement_on_falsey_value
    {
        assert_renders(
            '<h1></h1>',
            '<h1>{{# party }}SURPRISE PARTY!{{/ party }}</h1>',
            { party => 0 },
        );
    }

    test section_replacement_on_truthy_value
    {
        assert_renders(
            '<h1>SURPRISE PARTY!</h1>',
            '<h1>{{# party }}SURPRISE PARTY!{{/ party }}</h1>',
            { party => 1 },
        );
    }

    test section_replacement_with_hash
    {
        assert_renders(
            '<h1>SURPRISE PARTY!</h1>',
            '<h1>{{# party }}{{ type }}{{/ party }}</h1>',
            { party => { type => 'SURPRISE PARTY!' } },
        );
    }

    test section_replacement_with_mixed_scope_lookups
    {
        assert_renders(
            '<h1>SURPRISE PARTY! for Bob</h1>',
            '<h1>{{# party }}{{ event_name }} for {{ person }}{{/ party }}</h1>',
            { party => { event_name => 'SURPRISE PARTY!' }, person => 'Bob'},
        );
    }

    test section_replacement_with_object
    {
        assert_renders(
            '<h1>Welcome, Bryan</h1>',
            '<h1>{{# can_greet? }}{{ greeting }}, {{ greetee }}{{/ can_greet? }}</h1>',
            Greeter->new(greetee => 'Bryan'),
        );
    }

    test inverted_section_replacement_with_truthy_value
    {
        assert_renders(
            '<h1></h1>',
            '<h1>{{^ party }}SURPRISE PARTY!{{/ party }}</h1>',
            { party => 1 },
        );
    }

    test inverted_section_replacement_with_falsey_value
    {
        assert_renders(
            '<h1>SURPRISE PARTY!</h1>',
            '<h1>{{^ party }}SURPRISE PARTY!{{/ party }}</h1>',
            { party => 0 },
        );
    }

    test alternate_delimiters
    {
        assert_renders(
            '<h1>Welcome</h1>',
            '{{=<% %>=}}<h1><% greeting %></h1>',
            { greeting => 'Welcome' },
        );
    }

    test unusual_delimiters
    {
        assert_renders(
            '<h1>Welcome</h1>',
            '{{=== ===}}<h1>== greeting ==</h1>',
            { greeting => 'Welcome' },
        );
    }

    test regex_delimiters
    {
        assert_renders(
            '<h1>123</h1>',
            '{{= | | =}}<h1>|a||b||c|</h1>',
            { a => 1, b => 2, c => 3 },
        );
    }
}
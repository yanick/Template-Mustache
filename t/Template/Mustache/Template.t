use Test::Mini::Unit;

case t::Template::Mustache::Template {
    require Template::Mustache::Template;
    require Template::Mustache::Context;

    setup {
        $self->{tmpl} = Template::Mustache::Template->new(q'Hello, {{subject}}!');
    }

    test is_a_template_reference {
        assert_equal(ref($self->{tmpl}), 'Template::Mustache::Template');
    }

    test render_method_expands_source_string {
        my $ctx = Template::Mustache::Context->new({ subject => 'Dave' });
        assert_equal('Hello, Dave!', $self->{tmpl}->render($ctx));
    }

    test template_class_changes_after_render {
        my $ctx = Template::Mustache::Context->new();

        assert_equal(ref($self->{tmpl}), 'Template::Mustache::Template');
        $self->{tmpl}->render($ctx);
        refute_equal(ref($self->{tmpl}), 'Template::Mustache::Template');
        assert_isa($self->{tmpl}, 'Template::Mustache::Template');
    }
}
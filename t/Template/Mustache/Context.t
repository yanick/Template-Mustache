use Test::Mini::Unit;

{
    package Person;

    sub new {
        my ($class, %args) = @_;
        return bless \%args, $class;
    }

    sub name    { shift->{name} }
    sub home    { shift->{home} }
    sub species { 'Human'       }
}

testcase Template::Mustache::Context::Test
{
    use aliased 'Template::Mustache::Context';

    test basic_context_fetch_from_class
    {
        my $ctx = Context->new('Person');
        assert_equal($ctx->get('species'), 'Human');
    }

    test basic_context_fetch_from_instance
    {
        my $ctx = Context->new(Person->new(name => 'Bryan'));
        assert_equal($ctx->get('name'), 'Bryan');
    }

    test basic_context_fetch_from_hash
    {
        my $ctx = Context->new({ name => 'Phil' });
        assert_equal($ctx->get('name'), 'Phil');
    }

    test basic_content_fetch_failure
    {
        my $ctx = Context->new({ name => 'Steve' });
        assert_equal($ctx->get('age'), '');
    }

    test stacked_content_fetch_from_top
    {
        my $ctx = Context->new({ name => 'Edgar' });
        $ctx->push({ name => 'Suzie' });
        assert_equal($ctx->get('name'), 'Suzie');
    }

    test stacked_content_fetch_from_bottom
    {
        my $ctx = Context->new({ name => 'Greg' });
        $ctx->push({ age => 23 });
        $ctx->push({ town => 'Mill End', age => 324 });
        $ctx->push({ town => 'Astoria', color => 'red' });
        assert_equal($ctx->get('name'), 'Greg');
    }

    test stacked_content_fetch_after_pop
    {
        my $ctx = Context->new({ name => 'Will' });
        $ctx->push({ name => 'Annie' });
        $ctx->pop();
        assert_equal($ctx->get('name'), 'Will');
    }

    test set_content_fetch_from_top
    {
        my $ctx = Context->new({ name => 'Aaron' });
        $ctx->set(name => 'Abbey', height => 63);
        assert_equal($ctx->get('name'), 'Abbey');
    }

    test set_content_fetch_from_bottom
    {
        my $ctx = Context->new({ name => 'Tom' });
        $ctx->set(locale => 'EN');
        assert_equal($ctx->get('name'), 'Tom');
    }

    test set_content_fetch_after_pop
    {
        my $ctx = Context->new({ name => 'Jeremy' });
        $ctx->set(name => 'Jenny');
        $ctx->pop();
        assert_equal($ctx->get('name'), 'Jeremy');
    }
}

use Test::Mini::Unit;

use Template::Mustache::Context;

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

case t::Template::Mustache::Context
{
    sub ctx { shift->{ctx} }

    case FetchesFromClass {
        setup {
            $self->{ctx} = Template::Mustache::Context->new('Person');
        }

        test class_data_fetch {
            assert_equal($self->ctx->get('species'), 'Human');
        }

        test instance_data_fetch {
            assert_dies { $self->ctx->get('name') }
        }
    }

    case FetchesFromInstance {
        setup {
            my $person = Person->new(name => 'Bryan');
            $self->{ctx} = Template::Mustache::Context->new($person);
        }

        test class_data_fetch {
            assert_equal($self->ctx->get('species'), 'Human');
        }

        test instance_data_fetch {
            assert_equal($self->ctx->get('name'), 'Bryan');
        }

        test instance_data_miss {
            assert_empty($self->ctx->get('home'));
        }
    }

    case FetchesFromHash {
        setup {
            my $data = { name => 'Phil' };
            $self->{ctx} = Template::Mustache::Context->new($data);
        }

        test key_fetch {
            assert_equal($self->ctx->get('name'), 'Phil');
        }

        test key_miss {
            assert_empty($self->ctx->get('age'));
        }
    }

    case StackedContexts {
        setup {
            my $data = { name => 'Edgar', age => 37, town => 'Rufus' };
            $self->{ctx} = Template::Mustache::Context->new($data);
        }

        case PushMethod {
            setup {
                $self->ctx->push({ name => 'Suzie', home => 'Greenbow' });
            }

            test unique_keys_resolve {
                assert_equal($self->ctx->get('town'), 'Rufus');
                assert_equal($self->ctx->get('home'), 'Greenbow');
            }

            test duplicated_keys_reflect_topmost {
                assert_equal($self->ctx->get('name'), 'Suzie');
            }

            case AfterPop {
                setup { $self->ctx->pop() }

                test old_conflicts_resolve {
                    assert_equal($self->ctx->get('name'), 'Edgar');
                }

                test dead_keys_vanish {
                    assert_empty($self->ctx->get('home'));
                }
            }
        }

        case SetMethod {
            setup {
                $self->ctx->set(name => 'Suzie', home => 'Greenbow');
            }

            test unique_keys_resolve {
                assert_equal($self->ctx->get('town'), 'Rufus');
                assert_equal($self->ctx->get('home'), 'Greenbow');
            }

            test duplicated_keys_reflect_topmost {
                assert_equal($self->ctx->get('name'), 'Suzie');
            }

            case AfterPop {
                setup { $self->ctx->pop() }

                test old_conflicts_resolve {
                    assert_equal($self->ctx->get('name'), 'Edgar');
                }

                test dead_keys_vanish {
                    assert_empty($self->ctx->get('home'));
                }
            }
        }
    }
}

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

case t::Template::Mustache::Context {
    sub ctx { shift->{ctx} }

    case Fetches::From {
        case Class {
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

        case Instance {
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

        case Hash {
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

        case Stack {
            setup {
                $self->{ctx} = Template::Mustache::Context->new();
                $self->ctx->push({ $_ => 'a' }) for qw/ bottom middle summit /;
            }

            test stack_lookup_holds_reference_to_stack_frame {
                for my $frame (qw/ bottom middle summit /) {
                    $self->ctx->get($frame);
                    assert_equal($self->ctx->frame, { $frame => 'a' });
                }
            }
        }
    }

    case ContextManipulation {
        setup {
            my $data = { name => 'Edgar', town => 'Rufus' };
            $self->{ctx} = Template::Mustache::Context->new($data);
        }


        shared UnalteredContext {
            test key_lookup {
                assert_equal($self->ctx->get('name'), 'Edgar');
            }

            test key_miss {
                assert_empty($self->ctx->get('home'));
            }
        }

        shared StackedContexts {
            test unique_keys_resolve_appropriately {
                assert_equal($self->ctx->get('town'), 'Rufus');
                assert_equal($self->ctx->get('home'), 'Greenbow');
            }

            test duplicated_keys_reflect_topmost {
                assert_equal($self->ctx->get('name'), 'Suzie');
            }
        }


        reuse UnalteredContext;

        case PushMethod {
            setup {
                $self->ctx->push({ name => 'Suzie', home => 'Greenbow' });
            }

            reuse StackedContexts;

            case AfterPop {
                setup { $self->ctx->pop() }
                reuse UnalteredContext;
            }
        }

        case SetMethod {
            setup {
                $self->ctx->set(name => 'Suzie', home => 'Greenbow');
            }

            reuse StackedContexts;

            case AfterPop {
                setup { $self->ctx->pop() }
                reuse UnalteredContext;
            }
        }
    }
}

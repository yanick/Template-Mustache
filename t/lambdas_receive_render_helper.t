use strict;
use warnings;

use Test::Mini::Unit;
use Template::Mustache;

case t::LambdasReceiveRenderHelper {
    {
        ## no critic (RequireFilenameMatchesPackage)
        package t::LambdasReceiveRenderHelper::Mustache;
        use base 'Template::Mustache';

        sub name         { sub { pop->('{{user}}') } }
        sub obfuscated   { sub { pop->('{{'.reverse(shift).'}}') } }
        sub user         { '({{logged_in_as}})' }
        sub logged_in_as { 'Sam' }
    }

    case Interpolation {
        setup {
            $self->{tmpl} = 'I am {{name}}';
        }

        test from_hash {
            my $data = {
                name         => sub { pop->('{{user}}') },
                user         => '({{logged_in_as}})',
                logged_in_as => 'Sam',
            };

            my $rendered = Template::Mustache->render($self->{tmpl}, $data);
            assert_equal($rendered, 'I am (Sam)');
        }

        test from_class {
            my $data = 't::LambdasReceiveRenderHelper::Mustache';

            my $rendered = Template::Mustache->render($self->{tmpl}, $data);
            assert_equal($rendered, 'I am (Sam)');
        }

        test from_instance {
            my $data = t::LambdasReceiveRenderHelper::Mustache->new();

            my $rendered = Template::Mustache->render($self->{tmpl}, $data);
            assert_equal($rendered, 'I am (Sam)');
        }
    }

    case SectionTags {
        setup {
            $self->{tmpl} = 'I am {{#obfuscated}}resu{{/obfuscated}}';
        }

        test from_hash {
            my $data = {
                obfuscated   => sub { pop->('{{'.reverse(shift).'}}') },
                user         => '({{logged_in_as}})',
                logged_in_as => 'Sam',
            };

            my $rendered = Template::Mustache->render($self->{tmpl}, $data);
            assert_equal($rendered, 'I am (Sam)');
        }

        test from_class {
            my $data = 't::LambdasReceiveRenderHelper::Mustache';

            my $rendered = Template::Mustache->render($self->{tmpl}, $data);
            assert_equal($rendered, 'I am (Sam)');
        }

        test from_instance {
            my $data = t::LambdasReceiveRenderHelper::Mustache->new();

            my $rendered = Template::Mustache->render($self->{tmpl}, $data);
            assert_equal($rendered, 'I am (Sam)');
        }
    }
}

package Template::Mustache::Token::Block;

use Moo;

use MooseX::MungeHas { has_ro => [ 'is_ro' ] };

has_ro 'items';

1;

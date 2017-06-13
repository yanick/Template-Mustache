package Template::Mustache::Section;

use strict;
use warnings;

use Moo;

use Text::Balanced qw/ extract_multiple extract_tagged /;

sub compile {
    my( $self, $mustache, $pre, $post ) = @_;

    no warnings 'uninitialized';

    my @delim = @{ $mustache->delimiters };
    my $open = $delim[0] . '#' . $$self .  $delim[1];

    @delim = map { quotemeta } @delim;

    $$self =~ s/^\s+|\s+$//g;

    my $close = "$delim[0]/[\t ]*".$$self."[\t ]*$delim[1]";

    $post = $open . $post;
    $open = qr/$delim[0]#\s*$$self\s*$delim[1]/;
    warn $open;
    warn $post;

    my $inner = extract_multiple( $post, [
            sub {
                my $c = "(?m:^[ \t]*${close}[ \t]?\r?\n?\$";
                extract_tagged( $_[0], $open, $c, '' ) 
            },
            sub {extract_tagged( $_[0], $open, $close, '' ) },
            sub { die },
    ]);
#    my @got = ;
#    my $inner = $got[4];
#    $post = $got[1];
warn $inner;

    die "could not balance tag '$open', $post: $@\n" unless $inner;

    # standalone
    $DB::single = 1;
    
    # if( $pre =~ /(?:^|\r?\n)[\t ]*$/ and $inner =~ /^\s*?(?:$|\r?\n)/ ) {
    #     $pre =~ s/\r?\n?[ \t]*$//;
    #     $inner =~ s/^[\t ]*?($|\r?\n)/$1/;

    #     if ( length $pre == 0 ) {
    #         $inner =~ s/^\r?\n//;
    #     }
    # }

    # if( $inner =~ /(?:^|\r?\n)[\t ]*$/ and $post =~ /^\s*?(?:$|\r?\n)/ ) {
    #     $inner =~ s/(^|\r?\n)[\t ]*$/$1/;
    #     $post =~ s/^[ \t]*\r?\n?//;
    # }

    return sub { 
        my $context = shift;

        my $value = $mustache->resolve_context( $$self, $context );

        if( !$value ) {
            return $mustache->_compile_template($post, $pre)->($context);
        }

        my @list = ref $value eq 'ARRAY' ? @$value : ( $value );

        $pre .= $mustache->_compile_template( $inner, '' )->([ $_, @$context ])
            for @list;
        return $mustache->_compile_template( $post, $pre)->($context);

    };
}


1;

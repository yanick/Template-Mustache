#
# This parser was generated with
# Parse::RecDescent version 1.967015
#

package Template::Mustache::Parser;
our $AUTHORITY = 'cpan:YANICK';
$Template::Mustache::Parser::VERSION = '1.3.1';

use Parse::RecDescent;
{ my $ERRORS;


package Parse::RecDescent::Template::Mustache::Parser;
our $AUTHORITY = 'cpan:YANICK';
$Parse::RecDescent::Template::Mustache::Parser::VERSION = '1.3.1';

use strict;
use vars qw($skip $AUTOLOAD  );
@Parse::RecDescent::Template::Mustache::Parser::ISA = ();
$skip = qr//;


{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::Template::Mustache::Parser::AUTOLOAD   = sub
{
    no strict 'refs';

    ${"AUTOLOAD"} =~ s/^Parse::RecDescent::Template::Mustache::Parser/Parse::RecDescent/;
    goto &{${"AUTOLOAD"}};
}
}

push @Parse::RecDescent::Template::Mustache::Parser::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::_alternation_1_of_production_1_of_rule_template_item
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_template_item"};

    Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_template_item]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{partial, or section, or delimiter_change, or comment, or unescaped_variable_amp, or unescaped_variable, or variable, or verbatim});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [partial]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [partial]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::partial($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [partial]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [partial]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{partial}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [partial]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [section]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [section]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::section($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [section]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [section]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{section}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [section]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [delimiter_change]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[2];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [delimiter_change]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::delimiter_change($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [delimiter_change]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [delimiter_change]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{delimiter_change}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [delimiter_change]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [comment]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[3];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [comment]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::comment($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [comment]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [comment]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{comment}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [comment]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [unescaped_variable_amp]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[4];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [unescaped_variable_amp]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::unescaped_variable_amp($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [unescaped_variable_amp]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [unescaped_variable_amp]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{unescaped_variable_amp}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [unescaped_variable_amp]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [unescaped_variable]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[5];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [unescaped_variable]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::unescaped_variable($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [unescaped_variable]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [unescaped_variable]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{unescaped_variable}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [unescaped_variable]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [variable]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[6];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [variable]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::variable($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [variable]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{variable}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [variable]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [verbatim]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[7];
        $text = $_[1];
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [verbatim]},
                  Parse::RecDescent::_tracefirst($text),
                  q{_alternation_1_of_production_1_of_rule_template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::verbatim($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [verbatim]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{_alternation_1_of_production_1_of_rule_template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [verbatim]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{verbatim}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [verbatim]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<error...>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[8];
        
        my $_savetext;
        @item = (q{_alternation_1_of_production_1_of_rule_template_item});
        %item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_template_item});
        my $repcount = 0;


        

        Parse::RecDescent::_trace(q{Trying directive: [<error...>]},
                    Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE; 
        $_tok = do { if (1) { do {
        my $rule = $item[0];
           $rule =~ s/_/ /g;
        #WAS: Parse::RecDescent::_error("Invalid $rule: " . $expectation->message() ,$thisline);
        push @{$thisparser->{errors}}, ["Invalid $rule: " . $expectation->message() ,$thisline];
        } unless  $_noactions; undef } else {0} };
        if (defined($_tok))
        {
            Parse::RecDescent::_trace(q{>>Matched directive<< (return value: [}
                        . $_tok . q{])},
                        Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        }
        else
        {
            Parse::RecDescent::_trace(q{<<Didn't match directive>>},
                        Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        }
        
        last unless defined $_tok;
        push @item, $item{__DIRECTIVE1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<error...>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{_alternation_1_of_production_1_of_rule_template_item},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{_alternation_1_of_production_1_of_rule_template_item},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::close_section
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"close_section"};

    Parse::RecDescent::_trace(q{Trying rule: [close_section]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{close_section},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag '/' /\\s*/ '$arg[0]' /\\s*/ closing_tag /\\s*/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{close_section});
        %item = (__RULE__ => q{close_section});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{close_section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{close_section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: ['/']},
                      Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'/'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\//)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: ['$arg[0]']},
                      Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'$arg[0]'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "$arg[0]"; 1 } and
             substr($text,0,length($_tok)) eq $_tok and
             do { substr($text,0,length($_tok)) = ""; 1; }
        )
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $_tok . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING2__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{close_section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{close_section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN4__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    if ( $item[1] =~ /\n/ or $prev) {
        if ( $item[8] =~ /\n/ or length $text == 0 ) {
            $item[1] =~ s/(^|\n)[ \t]*?$/$1/;
            $item[8] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }
    [
        Template::Mustache::Token::Verbatim->new( content => $item[1] ),
        Template::Mustache::Token::Verbatim->new( content => $item[8] ),
    ]
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag '/' /\\s*/ '$arg[0]' /\\s*/ closing_tag /\\s*/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{close_section},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{close_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{close_section},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{close_section},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::closing_tag
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"closing_tag"};

    Parse::RecDescent::_trace(q{Trying rule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{closing_tag},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'$thisparser->\{closing_tag\}'});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['$thisparser->\{closing_tag\}']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{closing_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{closing_tag});
        %item = (__RULE__ => q{closing_tag});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['$thisparser->\{closing_tag\}']},
                      Parse::RecDescent::_tracefirst($text),
                      q{closing_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "$thisparser->{closing_tag}"; 1 } and
             substr($text,0,length($_tok)) eq $_tok and
             do { substr($text,0,length($_tok)) = ""; 1; }
        )
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $_tok . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['$thisparser->\{closing_tag\}']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{closing_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{closing_tag},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{closing_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{closing_tag},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{closing_tag},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::comment
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"comment"};

    Parse::RecDescent::_trace(q{Trying rule: [comment]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{comment},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{standalone_surround});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [standalone_surround]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{comment},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{comment});
        %item = (__RULE__ => q{comment});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [standalone_surround]},
                  Parse::RecDescent::_tracefirst($text),
                  q{comment},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::standalone_surround($thisparser,$text,$repeating,$_noactions,sub { return [$item[0]] },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [standalone_surround]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{comment},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [standalone_surround]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{comment},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{standalone_surround}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{comment},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do { 
    Template::Mustache::Token::Verbatim->new( 
        content => $item[1][0] . $item[1][1]
    ),
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [standalone_surround]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{comment},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{comment},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{comment},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{comment},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{comment},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::comment_inner
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"comment_inner"};

    Parse::RecDescent::_trace(q{Trying rule: [comment_inner]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{comment_inner},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'!'});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['!' /.*?(?=\\Q$item[2]\\E)/s]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{comment_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{comment_inner});
        %item = (__RULE__ => q{comment_inner});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['!']},
                      Parse::RecDescent::_tracefirst($text),
                      q{comment_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\!/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{comment_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do { $thisparser->{closing_tag} };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/.*?(?=\\Q$item[2]\\E)/s]}, Parse::RecDescent::_tracefirst($text),
                      q{comment_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/.*?(?=\\Q$item[2]\\E)/s})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:.*?(?=\Q$item[2]\E))/s)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['!' /.*?(?=\\Q$item[2]\\E)/s]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{comment_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{comment_inner},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{comment_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{comment_inner},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{comment_inner},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::delimiter_change
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"delimiter_change"};

    Parse::RecDescent::_trace(q{Trying rule: [delimiter_change]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{delimiter_change},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{standalone_surround});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [standalone_surround]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{delimiter_change},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{delimiter_change});
        %item = (__RULE__ => q{delimiter_change});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [standalone_surround]},
                  Parse::RecDescent::_tracefirst($text),
                  q{delimiter_change},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::standalone_surround($thisparser,$text,$repeating,$_noactions,sub { return [$item[0]] },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [standalone_surround]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{delimiter_change},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [standalone_surround]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{standalone_surround}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    die "needs two delimiters\n" unless @{ $item[1][2] } == 2;
    ( $thisparser->{opening_tag},
        $thisparser->{closing_tag} ) = @{ $item[1][2] };

    Template::Mustache::Token::Verbatim->new( content =>
        $item[1][0] . $item[1][1]
    );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [standalone_surround]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{delimiter_change},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{delimiter_change},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{delimiter_change},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{delimiter_change},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::delimiter_change_inner
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"delimiter_change_inner"};

    Parse::RecDescent::_trace(q{Trying rule: [delimiter_change_inner]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{delimiter_change_inner},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'='});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['=' /\\s*/ /.*?(?=\\=\\Q$item[2]\\E)/s '=']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{delimiter_change_inner});
        %item = (__RULE__ => q{delimiter_change_inner});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['=']},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\=/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    $thisparser->{closing_tag}
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/.*?(?=\\=\\Q$item[2]\\E)/s]}, Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/.*?(?=\\=\\Q$item[2]\\E)/s})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:.*?(?=\=\Q$item[2]\E))/s)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: ['=']},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'='})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\=/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    [ split ' ', $item[4] ]
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION2__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['=' /\\s*/ /.*?(?=\\=\\Q$item[2]\\E)/s '=']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{delimiter_change_inner},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{delimiter_change_inner},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{delimiter_change_inner},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{delimiter_change_inner},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::eofile
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"eofile"};

    Parse::RecDescent::_trace(q{Trying rule: [eofile]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{eofile},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/^\\Z/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/^\\Z/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{eofile},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{eofile});
        %item = (__RULE__ => q{eofile});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/^\\Z/]}, Parse::RecDescent::_tracefirst($text),
                      q{eofile},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:^\Z)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/^\\Z/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{eofile},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{eofile},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{eofile},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{eofile},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{eofile},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::inner_section
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"inner_section"};

    Parse::RecDescent::_trace(q{Trying rule: [inner_section]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{inner_section},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{close_section});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [close_section template_item]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{inner_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{inner_section});
        %item = (__RULE__ => q{inner_section});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [close_section]},
                  Parse::RecDescent::_tracefirst($text),
                  q{inner_section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        $_savetext = $text;if (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::close_section($thisparser,$text,$repeating,1,sub { return [ $arg[0] ] },undef)))
        {
            $text = $_savetext;
            Parse::RecDescent::_trace(q{<<...!Matched(reject) subrule: [close_section]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{inner_section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>...!Didn't match(keep) subrule: [close_section]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{inner_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{close_section}} = $_tok;
        push @item, $_tok;
        $text = $_savetext;
        }

        Parse::RecDescent::_trace(q{Trying subrule: [template_item]},
                  Parse::RecDescent::_tracefirst($text),
                  q{inner_section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{template_item})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::template_item($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [template_item]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{inner_section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [template_item]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{inner_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{template_item}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{>>Matched production: [close_section template_item]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{inner_section},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{inner_section},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{inner_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{inner_section},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{inner_section},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::open_section
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"open_section"};

    Parse::RecDescent::_trace(q{Trying rule: [open_section]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{open_section},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag /[#^]/ /\\s*/ /[-\\w.]+/ /\\s*/ closing_tag /\\s*/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{open_section});
        %item = (__RULE__ => q{open_section});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{open_section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{open_section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/[#^]/]}, Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/[#^]/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[#^])/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/[-\\w.]+/]}, Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/[-\\w.]+/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[-\w.]+)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN4__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN5__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{open_section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{open_section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN6__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    if ( $item[1] =~ /\n/ or $prev ) {
        if ( $item[8] =~ /\n/ ) {
            $item[1] =~ s/(^|\n)[ \t]*?$/$1/;
            $item[8] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }

    [ $item[5], $item[3] eq '^',
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] )
    ];
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag /[#^]/ /\\s*/ /[-\\w.]+/ /\\s*/ closing_tag /\\s*/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{open_section},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{open_section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{open_section},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{open_section},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::opening_tag
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"opening_tag"};

    Parse::RecDescent::_trace(q{Trying rule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{opening_tag},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'$thisparser->\{opening_tag\}'});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['$thisparser->\{opening_tag\}']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{opening_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{opening_tag});
        %item = (__RULE__ => q{opening_tag});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['$thisparser->\{opening_tag\}']},
                      Parse::RecDescent::_tracefirst($text),
                      q{opening_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "$thisparser->{opening_tag}"; 1 } and
             substr($text,0,length($_tok)) eq $_tok and
             do { substr($text,0,length($_tok)) = ""; 1; }
        )
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $_tok . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['$thisparser->\{opening_tag\}']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{opening_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{opening_tag},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{opening_tag},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{opening_tag},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{opening_tag},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::partial
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"partial"};

    Parse::RecDescent::_trace(q{Trying rule: [partial]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{partial},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag '>' /\\s*/ /[\\/-\\w.]+/ /\\s*/ closing_tag /\\s*/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{partial});
        %item = (__RULE__ => q{partial});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{partial},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{partial},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: ['>']},
                      Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'>'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\>/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/[\\/-\\w.]+/]}, Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/[\\/-\\w.]+/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[\/-\w.]+)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN4__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{partial},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{partial},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN5__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    my $indent = '';
    if ( $item[1] =~ /\n/ or $prev ) {
        if ( $item[8] =~ /\n/  or length $text == 0) {
            $item[1] =~ /(^|\n)([ \t]*?)$/;
            $indent = $2;
            $item[8] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Partial->new( name => $item[5],
                indent => $indent ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] ),
        ],
        )
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag '>' /\\s*/ /[\\/-\\w.]+/ /\\s*/ closing_tag /\\s*/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{partial},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{partial},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{partial},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{partial},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::section
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"section"};

    Parse::RecDescent::_trace(q{Trying rule: [section]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{section},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{open_section});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [open_section inner_section close_section]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{section});
        %item = (__RULE__ => q{section});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [open_section]},
                  Parse::RecDescent::_tracefirst($text),
                  q{section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::open_section($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [open_section]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [open_section]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{open_section}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {$thisoffset};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying repeated subrule: [inner_section]},
                  Parse::RecDescent::_tracefirst($text),
                  q{section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{inner_section})->at($text);
        
        unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Template::Mustache::Parser::inner_section, 0, 100000000, $_noactions,$expectation,sub { return [ $item[1][0] ] },undef)))
        {
            Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [inner_section]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched repeated subrule: [inner_section]<< (}
                    . @$_tok . q{ times)},

                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{inner_section(s?)}} = $_tok;
        push @item, $_tok;
        


        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {$thisoffset
    - $item[2]
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION2__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying subrule: [close_section]},
                  Parse::RecDescent::_tracefirst($text),
                  q{section},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{close_section})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::close_section($thisparser,$text,$repeating,$_noactions,sub { return [ $item[1][0] ] },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [close_section]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{section},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [close_section]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{close_section}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    my $raw = substr( $thisparser->{fulltext}, $item[2], $item[4] );
    Template::Mustache::Token::Template->new( items => [
        $item[1]->[2],
        Template::Mustache::Token::Section->new(
            delimiters => [ map { $thisparser->{$_} } qw/ opening_tag closing_tag / ],
            variable => $item[1][0],
            inverse => $item[1][1],
            raw => $raw,
            template => Template::Mustache::Token::Template->new( 
                items => [ 
                    $item[1][3], @{$item[3]}, $item[5][0] ], 
            )
        ),
        $item[5][1]
        ]
    );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION3__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [open_section inner_section close_section]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{section},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{section},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{section},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{section},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::standalone_surround
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"standalone_surround"};

    Parse::RecDescent::_trace(q{Trying rule: [standalone_surround]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{standalone_surround},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag /\\s*/ <matchrule:$arg[0]_inner> closing_tag /\\s*/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{standalone_surround});
        %item = (__RULE__ => q{standalone_surround});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{standalone_surround},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{standalone_surround},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [$arg[0]_inner]},
                  Parse::RecDescent::_tracefirst($text),
                  q{standalone_surround},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{<matchrule:$arg[0]_inner>})->at($text);
        unless (defined ($_tok = &{'Parse::RecDescent::Template::Mustache::Parser::'.qq{$arg[0]_inner}}($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [$arg[0]_inner]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{standalone_surround},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [$arg[0]_inner]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{$arg[0]_inner}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{standalone_surround},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{standalone_surround},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;

    if ( $item[1] =~ /\n/ or $prev) {
        if ( $item[6] =~ /\n/  or length $text == 0) {
            $item[1] =~ s/(\r?\n?)\s*?$/$1/;
            $item[6] =~ s/^.*?\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }

    [  @item[1,6,4] ],
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag /\\s*/ <matchrule:$arg[0]_inner> closing_tag /\\s*/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{standalone_surround},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{standalone_surround},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{standalone_surround},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{standalone_surround},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::template
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"template"};

    Parse::RecDescent::_trace(q{Trying rule: [template]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{template},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [template_item eofile]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{template});
        %item = (__RULE__ => q{template});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do { my ($otag,$ctag) = @arg ? @arg : ( qw/ {{ }} / );
    $thisparser->{opening_tag} = $otag;
    $thisparser->{closing_tag} = $ctag;
    $thisparser->{prev_is_standalone} = 1;
    1;
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying repeated subrule: [template_item]},
                  Parse::RecDescent::_tracefirst($text),
                  q{template},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{template_item})->at($text);
        
        unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Template::Mustache::Parser::template_item, 0, 100000000, $_noactions,$expectation,sub { \@arg },undef)))
        {
            Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [template_item]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{template},
                          $tracelevel)
                            if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched repeated subrule: [template_item]<< (}
                    . @$_tok . q{ times)},

                      Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{template_item(s?)}} = $_tok;
        push @item, $_tok;
        


        Parse::RecDescent::_trace(q{Trying subrule: [eofile]},
                  Parse::RecDescent::_tracefirst($text),
                  q{template},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{eofile})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::eofile($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [eofile]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{template},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [eofile]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{eofile}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    Template::Mustache::Token::Template->new(
        items => $item[2]
    );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION2__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [template_item eofile]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<error...>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        
        my $_savetext;
        @item = (q{template});
        %item = (__RULE__ => q{template});
        my $repcount = 0;


        

        Parse::RecDescent::_trace(q{Trying directive: [<error...>]},
                    Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE; 
        $_tok = do { if (1) { do {
        my $rule = $item[0];
           $rule =~ s/_/ /g;
        #WAS: Parse::RecDescent::_error("Invalid $rule: " . $expectation->message() ,$thisline);
        push @{$thisparser->{errors}}, ["Invalid $rule: " . $expectation->message() ,$thisline];
        } unless  $_noactions; undef } else {0} };
        if (defined($_tok))
        {
            Parse::RecDescent::_trace(q{>>Matched directive<< (return value: [}
                        . $_tok . q{])},
                        Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        }
        else
        {
            Parse::RecDescent::_trace(q{<<Didn't match directive>>},
                        Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        }
        
        last unless defined $_tok;
        push @item, $item{__DIRECTIVE1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<error...>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{template},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{template},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{template},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{template},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::template_item
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"template_item"};

    Parse::RecDescent::_trace(q{Trying rule: [template_item]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{partial, or section, or delimiter_change, or comment, or unescaped_variable_amp, or unescaped_variable, or variable, or verbatim});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [partial, or section, or delimiter_change, or comment, or unescaped_variable_amp, or unescaped_variable, or variable, or verbatim]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{template_item});
        %item = (__RULE__ => q{template_item});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_template_item]},
                  Parse::RecDescent::_tracefirst($text),
                  q{template_item},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::_alternation_1_of_production_1_of_rule_template_item($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_template_item]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{template_item},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_template_item]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{_alternation_1_of_production_1_of_rule_template_item}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    $item[1]
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [partial, or section, or delimiter_change, or comment, or unescaped_variable_amp, or unescaped_variable, or variable, or verbatim]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{template_item},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{template_item},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{template_item},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{template_item},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::unescaped_variable
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"unescaped_variable"};

    Parse::RecDescent::_trace(q{Trying rule: [unescaped_variable]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{unescaped_variable},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag '\{' /\\s*/ variable_name /\\s*/ '\}' closing_tag]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{unescaped_variable});
        %item = (__RULE__ => q{unescaped_variable});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{unescaped_variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{unescaped_variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: ['\{']},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'\{'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\{/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [variable_name]},
                  Parse::RecDescent::_tracefirst($text),
                  q{unescaped_variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{variable_name})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::variable_name($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable_name]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{unescaped_variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [variable_name]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{variable_name}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: ['\}']},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'\}'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\}/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{unescaped_variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{unescaped_variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( 
                name => $item{variable_name},
                escape => 0,
            ),
        ]
    );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag '\{' /\\s*/ variable_name /\\s*/ '\}' closing_tag]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{unescaped_variable},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{unescaped_variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{unescaped_variable},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{unescaped_variable},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::unescaped_variable_amp
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"unescaped_variable_amp"};

    Parse::RecDescent::_trace(q{Trying rule: [unescaped_variable_amp]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{unescaped_variable_amp},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag '&' /\\s*/ variable_name /\\s*/ closing_tag]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{unescaped_variable_amp});
        %item = (__RULE__ => q{unescaped_variable_amp});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{unescaped_variable_amp},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{unescaped_variable_amp},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: ['&']},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'&'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\&/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [variable_name]},
                  Parse::RecDescent::_tracefirst($text),
                  q{unescaped_variable_amp},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{variable_name})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::variable_name($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable_name]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{unescaped_variable_amp},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [variable_name]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{variable_name}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{unescaped_variable_amp},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{unescaped_variable_amp},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( 
                name => $item{variable_name},
                escape => 0,
            ),
        ]
    );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag '&' /\\s*/ variable_name /\\s*/ closing_tag]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{unescaped_variable_amp},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{unescaped_variable_amp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{unescaped_variable_amp},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{unescaped_variable_amp},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::variable
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"variable"};

    Parse::RecDescent::_trace(q{Trying rule: [variable]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{variable},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/\\s*/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/\\s*/ opening_tag /\\s*/ variable_name /\\s*/ closing_tag]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{variable});
        %item = (__RULE__ => q{variable});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [opening_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{opening_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::opening_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [opening_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [opening_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{opening_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [variable_name]},
                  Parse::RecDescent::_tracefirst($text),
                  q{variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{variable_name})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::variable_name($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable_name]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [variable_name]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{variable_name}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/\\s*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\s*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\s*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN3__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [closing_tag]},
                  Parse::RecDescent::_tracefirst($text),
                  q{variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{closing_tag})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Template::Mustache::Parser::closing_tag($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [closing_tag]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [closing_tag]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{closing_tag}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    $thisparser->{prev_is_standalone} = 0;
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( name => $item{variable_name} ),
        ]
    );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/\\s*/ opening_tag /\\s*/ variable_name /\\s*/ closing_tag]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{variable},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{variable},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{variable},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::variable_name
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"variable_name"};

    Parse::RecDescent::_trace(q{Trying rule: [variable_name]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{variable_name},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/[-\\w.]+/});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/[-\\w.]+/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{variable_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{variable_name});
        %item = (__RULE__ => q{variable_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/[-\\w.]+/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[-\w.]+)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/[-\\w.]+/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{variable_name},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{variable_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{variable_name},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{variable_name},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Template::Mustache::Parser::verbatim
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"verbatim"};

    Parse::RecDescent::_trace(q{Trying rule: [verbatim]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{verbatim},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{});
    $expectation->at($_[1]);
    
    my $thisoffset;
    tie $thisoffset, q{Parse::RecDescent::OffsetCounter}, \$text, $thisparser;
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/^\\s*\\S*?(?=\\Q$item[1]\\E|\\s|$)/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{verbatim},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{verbatim});
        %item = (__RULE__ => q{verbatim});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{verbatim},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do { $thisparser->{opening_tag} };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/^\\s*\\S*?(?=\\Q$item[1]\\E|\\s|$)/]}, Parse::RecDescent::_tracefirst($text),
                      q{verbatim},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/^\\s*\\S*?(?=\\Q$item[1]\\E|\\s|$)/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:^\s*\S*?(?=\Q$item[1]\E|\s|$))/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{verbatim},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
    $thisparser->{prev_is_standalone} = 0;
    Template::Mustache::Token::Verbatim->new( content => $item[2] );
};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION2__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/^\\s*\\S*?(?=\\Q$item[1]\\E|\\s|$)/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{verbatim},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{verbatim},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{verbatim},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{verbatim},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{verbatim},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}
}
package Template::Mustache::Parser;

 sub new { my $self = bless( {
                 '_AUTOACTION' => undef,
                 '_AUTOTREE' => undef,
                 '_check' => {
                               'itempos' => '',
                               'prevcolumn' => '',
                               'prevline' => '',
                               'prevoffset' => '',
                               'thiscolumn' => '',
                               'thisoffset' => 1
                             },
                 'localvars' => '',
                 'namespace' => 'Parse::RecDescent::Template::Mustache::Parser',
                 'rules' => {
                              '_alternation_1_of_production_1_of_rule_template_item' => bless( {
                                                                                                 'calls' => [
                                                                                                              'partial',
                                                                                                              'section',
                                                                                                              'delimiter_change',
                                                                                                              'comment',
                                                                                                              'unescaped_variable_amp',
                                                                                                              'unescaped_variable',
                                                                                                              'variable',
                                                                                                              'verbatim'
                                                                                                            ],
                                                                                                 'changed' => 0,
                                                                                                 'impcount' => 0,
                                                                                                 'line' => 184,
                                                                                                 'name' => '_alternation_1_of_production_1_of_rule_template_item',
                                                                                                 'opcount' => 0,
                                                                                                 'prods' => [
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'partial'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => undef,
                                                                                                                       'number' => 0,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'section'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 1,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'delimiter_change'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 2,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'comment'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 3,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'unescaped_variable_amp'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 4,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'unescaped_variable'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 5,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'variable'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 6,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'argcode' => undef,
                                                                                                                                             'implicit' => undef,
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'matchrule' => 0,
                                                                                                                                             'subrule' => 'verbatim'
                                                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 7,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'actcount' => 0,
                                                                                                                       'dircount' => 1,
                                                                                                                       'error' => 1,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'commitonly' => '',
                                                                                                                                             'hashname' => '__DIRECTIVE1__',
                                                                                                                                             'line' => 184,
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'msg' => ''
                                                                                                                                           }, 'Parse::RecDescent::Error' )
                                                                                                                                  ],
                                                                                                                       'line' => 184,
                                                                                                                       'number' => 8,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 0,
                                                                                                                       'uncommit' => 0
                                                                                                                     }, 'Parse::RecDescent::Production' )
                                                                                                            ],
                                                                                                 'vars' => ''
                                                                                               }, 'Parse::RecDescent::Rule' ),
                              'close_section' => bless( {
                                                          'calls' => [
                                                                       'opening_tag',
                                                                       'closing_tag'
                                                                     ],
                                                          'changed' => 0,
                                                          'impcount' => 0,
                                                          'line' => 80,
                                                          'name' => 'close_section',
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'actcount' => 1,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '/\\\\s*/',
                                                                                                      'hashname' => '__PATTERN1__',
                                                                                                      'ldelim' => '/',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'mod' => '',
                                                                                                      'pattern' => '\\s*',
                                                                                                      'rdelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => undef,
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'matchrule' => 0,
                                                                                                      'subrule' => 'opening_tag'
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'description' => '\'/\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => '/'
                                                                                                    }, 'Parse::RecDescent::Literal' ),
                                                                                             bless( {
                                                                                                      'description' => '/\\\\s*/',
                                                                                                      'hashname' => '__PATTERN2__',
                                                                                                      'ldelim' => '/',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'mod' => '',
                                                                                                      'pattern' => '\\s*',
                                                                                                      'rdelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'description' => '\'$arg[0]\'',
                                                                                                      'hashname' => '__STRING2__',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => '$arg[0]'
                                                                                                    }, 'Parse::RecDescent::InterpLit' ),
                                                                                             bless( {
                                                                                                      'description' => '/\\\\s*/',
                                                                                                      'hashname' => '__PATTERN3__',
                                                                                                      'ldelim' => '/',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'mod' => '',
                                                                                                      'pattern' => '\\s*',
                                                                                                      'rdelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => undef,
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'matchrule' => 0,
                                                                                                      'subrule' => 'closing_tag'
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'description' => '/\\\\s*/',
                                                                                                      'hashname' => '__PATTERN4__',
                                                                                                      'ldelim' => '/',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0,
                                                                                                      'mod' => '',
                                                                                                      'pattern' => '\\s*',
                                                                                                      'rdelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'code' => '{
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    if ( $item[1] =~ /\\n/ or $prev) {
        if ( $item[8] =~ /\\n/ or length $text == 0 ) {
            $item[1] =~ s/(^|\\n)[ \\t]*?$/$1/;
            $item[8] =~ s/^.*?\\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }
    [
        Template::Mustache::Token::Verbatim->new( content => $item[1] ),
        Template::Mustache::Token::Verbatim->new( content => $item[8] ),
    ]
}',
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'line' => 80,
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef,
                                                                                'number' => 0,
                                                                                'patcount' => 4,
                                                                                'strcount' => 2,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'vars' => ''
                                                        }, 'Parse::RecDescent::Rule' ),
                              'closing_tag' => bless( {
                                                        'calls' => [],
                                                        'changed' => 0,
                                                        'impcount' => 0,
                                                        'line' => 19,
                                                        'name' => 'closing_tag',
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'actcount' => 0,
                                                                              'dircount' => 0,
                                                                              'error' => undef,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'description' => '\'$thisparser->\\{closing_tag\\}\'',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'line' => 19,
                                                                                                    'lookahead' => 0,
                                                                                                    'pattern' => '$thisparser->{closing_tag}'
                                                                                                  }, 'Parse::RecDescent::InterpLit' )
                                                                                         ],
                                                                              'line' => undef,
                                                                              'number' => 0,
                                                                              'patcount' => 0,
                                                                              'strcount' => 1,
                                                                              'uncommit' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'vars' => ''
                                                      }, 'Parse::RecDescent::Rule' ),
                              'comment' => bless( {
                                                    'calls' => [
                                                                 'standalone_surround'
                                                               ],
                                                    'changed' => 0,
                                                    'impcount' => 0,
                                                    'line' => 111,
                                                    'name' => 'comment',
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'actcount' => 1,
                                                                          'dircount' => 0,
                                                                          'error' => undef,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'argcode' => '[$item[0]]',
                                                                                                'implicit' => undef,
                                                                                                'line' => 111,
                                                                                                'lookahead' => 0,
                                                                                                'matchrule' => 0,
                                                                                                'subrule' => 'standalone_surround'
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'code' => '{ 
    Template::Mustache::Token::Verbatim->new( 
        content => $item[1][0] . $item[1][1]
    ),
}',
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'line' => 111,
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'line' => undef,
                                                                          'number' => 0,
                                                                          'patcount' => 0,
                                                                          'strcount' => 0,
                                                                          'uncommit' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'vars' => ''
                                                  }, 'Parse::RecDescent::Rule' ),
                              'comment_inner' => bless( {
                                                          'calls' => [],
                                                          'changed' => 0,
                                                          'impcount' => 0,
                                                          'line' => 117,
                                                          'name' => 'comment_inner',
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'actcount' => 1,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'!\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 117,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => '!'
                                                                                                    }, 'Parse::RecDescent::Literal' ),
                                                                                             bless( {
                                                                                                      'code' => '{ $thisparser->{closing_tag} }',
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'line' => 117,
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Action' ),
                                                                                             bless( {
                                                                                                      'description' => '/.*?(?=\\\\Q$item[2]\\\\E)/s',
                                                                                                      'hashname' => '__PATTERN1__',
                                                                                                      'ldelim' => '/',
                                                                                                      'line' => 117,
                                                                                                      'lookahead' => 0,
                                                                                                      'mod' => 's',
                                                                                                      'pattern' => '.*?(?=\\Q$item[2]\\E)',
                                                                                                      'rdelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' )
                                                                                           ],
                                                                                'line' => undef,
                                                                                'number' => 0,
                                                                                'patcount' => 1,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'vars' => ''
                                                        }, 'Parse::RecDescent::Rule' ),
                              'delimiter_change' => bless( {
                                                             'calls' => [
                                                                          'standalone_surround'
                                                                        ],
                                                             'changed' => 0,
                                                             'impcount' => 0,
                                                             'line' => 25,
                                                             'name' => 'delimiter_change',
                                                             'opcount' => 0,
                                                             'prods' => [
                                                                          bless( {
                                                                                   'actcount' => 1,
                                                                                   'dircount' => 0,
                                                                                   'error' => undef,
                                                                                   'items' => [
                                                                                                bless( {
                                                                                                         'argcode' => '[$item[0]]',
                                                                                                         'implicit' => undef,
                                                                                                         'line' => 25,
                                                                                                         'lookahead' => 0,
                                                                                                         'matchrule' => 0,
                                                                                                         'subrule' => 'standalone_surround'
                                                                                                       }, 'Parse::RecDescent::Subrule' ),
                                                                                                bless( {
                                                                                                         'code' => '{
    die "needs two delimiters\\n" unless @{ $item[1][2] } == 2;
    ( $thisparser->{opening_tag},
        $thisparser->{closing_tag} ) = @{ $item[1][2] };

    Template::Mustache::Token::Verbatim->new( content =>
        $item[1][0] . $item[1][1]
    );
}',
                                                                                                         'hashname' => '__ACTION1__',
                                                                                                         'line' => 25,
                                                                                                         'lookahead' => 0
                                                                                                       }, 'Parse::RecDescent::Action' )
                                                                                              ],
                                                                                   'line' => undef,
                                                                                   'number' => 0,
                                                                                   'patcount' => 0,
                                                                                   'strcount' => 0,
                                                                                   'uncommit' => undef
                                                                                 }, 'Parse::RecDescent::Production' )
                                                                        ],
                                                             'vars' => ''
                                                           }, 'Parse::RecDescent::Rule' ),
                              'delimiter_change_inner' => bless( {
                                                                   'calls' => [],
                                                                   'changed' => 0,
                                                                   'impcount' => 0,
                                                                   'line' => 35,
                                                                   'name' => 'delimiter_change_inner',
                                                                   'opcount' => 0,
                                                                   'prods' => [
                                                                                bless( {
                                                                                         'actcount' => 2,
                                                                                         'dircount' => 0,
                                                                                         'error' => undef,
                                                                                         'items' => [
                                                                                                      bless( {
                                                                                                               'description' => '\'=\'',
                                                                                                               'hashname' => '__STRING1__',
                                                                                                               'line' => 35,
                                                                                                               'lookahead' => 0,
                                                                                                               'pattern' => '='
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'code' => '{
    $thisparser->{closing_tag}
}',
                                                                                                               'hashname' => '__ACTION1__',
                                                                                                               'line' => 35,
                                                                                                               'lookahead' => 0
                                                                                                             }, 'Parse::RecDescent::Action' ),
                                                                                                      bless( {
                                                                                                               'description' => '/\\\\s*/',
                                                                                                               'hashname' => '__PATTERN1__',
                                                                                                               'ldelim' => '/',
                                                                                                               'line' => 37,
                                                                                                               'lookahead' => 0,
                                                                                                               'mod' => '',
                                                                                                               'pattern' => '\\s*',
                                                                                                               'rdelim' => '/'
                                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                                      bless( {
                                                                                                               'description' => '/.*?(?=\\\\=\\\\Q$item[2]\\\\E)/s',
                                                                                                               'hashname' => '__PATTERN2__',
                                                                                                               'ldelim' => '/',
                                                                                                               'line' => 37,
                                                                                                               'lookahead' => 0,
                                                                                                               'mod' => 's',
                                                                                                               'pattern' => '.*?(?=\\=\\Q$item[2]\\E)',
                                                                                                               'rdelim' => '/'
                                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                                      bless( {
                                                                                                               'description' => '\'=\'',
                                                                                                               'hashname' => '__STRING2__',
                                                                                                               'line' => 37,
                                                                                                               'lookahead' => 0,
                                                                                                               'pattern' => '='
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'code' => '{
    [ split \' \', $item[4] ]
}',
                                                                                                               'hashname' => '__ACTION2__',
                                                                                                               'line' => 37,
                                                                                                               'lookahead' => 0
                                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                                    ],
                                                                                         'line' => undef,
                                                                                         'number' => 0,
                                                                                         'patcount' => 2,
                                                                                         'strcount' => 2,
                                                                                         'uncommit' => undef
                                                                                       }, 'Parse::RecDescent::Production' )
                                                                              ],
                                                                   'vars' => ''
                                                                 }, 'Parse::RecDescent::Rule' ),
                              'eofile' => bless( {
                                                   'calls' => [],
                                                   'changed' => 0,
                                                   'impcount' => 0,
                                                   'line' => 4,
                                                   'name' => 'eofile',
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'actcount' => 0,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '/^\\\\Z/',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'ldelim' => '/',
                                                                                               'line' => 4,
                                                                                               'lookahead' => 0,
                                                                                               'mod' => '',
                                                                                               'pattern' => '^\\Z',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' )
                                                                                    ],
                                                                         'line' => undef,
                                                                         'number' => 0,
                                                                         'patcount' => 1,
                                                                         'strcount' => 0,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'vars' => ''
                                                 }, 'Parse::RecDescent::Rule' ),
                              'inner_section' => bless( {
                                                          'calls' => [
                                                                       'close_section',
                                                                       'template_item'
                                                                     ],
                                                          'changed' => 0,
                                                          'impcount' => 0,
                                                          'line' => 119,
                                                          'name' => 'inner_section',
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'argcode' => '[ $arg[0] ]',
                                                                                                      'implicit' => undef,
                                                                                                      'line' => 119,
                                                                                                      'lookahead' => -1,
                                                                                                      'matchrule' => 0,
                                                                                                      'subrule' => 'close_section'
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => undef,
                                                                                                      'line' => 119,
                                                                                                      'lookahead' => 0,
                                                                                                      'matchrule' => 0,
                                                                                                      'subrule' => 'template_item'
                                                                                                    }, 'Parse::RecDescent::Subrule' )
                                                                                           ],
                                                                                'line' => undef,
                                                                                'number' => 0,
                                                                                'patcount' => 0,
                                                                                'strcount' => 0,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'vars' => ''
                                                        }, 'Parse::RecDescent::Rule' ),
                              'open_section' => bless( {
                                                         'calls' => [
                                                                      'opening_tag',
                                                                      'closing_tag'
                                                                    ],
                                                         'changed' => 0,
                                                         'impcount' => 0,
                                                         'line' => 63,
                                                         'name' => 'open_section',
                                                         'opcount' => 0,
                                                         'prods' => [
                                                                      bless( {
                                                                               'actcount' => 1,
                                                                               'dircount' => 0,
                                                                               'error' => undef,
                                                                               'items' => [
                                                                                            bless( {
                                                                                                     'description' => '/\\\\s*/',
                                                                                                     'hashname' => '__PATTERN1__',
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'mod' => '',
                                                                                                     'pattern' => '\\s*',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' ),
                                                                                            bless( {
                                                                                                     'argcode' => undef,
                                                                                                     'implicit' => undef,
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'matchrule' => 0,
                                                                                                     'subrule' => 'opening_tag'
                                                                                                   }, 'Parse::RecDescent::Subrule' ),
                                                                                            bless( {
                                                                                                     'description' => '/[#^]/',
                                                                                                     'hashname' => '__PATTERN2__',
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'mod' => '',
                                                                                                     'pattern' => '[#^]',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' ),
                                                                                            bless( {
                                                                                                     'description' => '/\\\\s*/',
                                                                                                     'hashname' => '__PATTERN3__',
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'mod' => '',
                                                                                                     'pattern' => '\\s*',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' ),
                                                                                            bless( {
                                                                                                     'description' => '/[-\\\\w.]+/',
                                                                                                     'hashname' => '__PATTERN4__',
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'mod' => '',
                                                                                                     'pattern' => '[-\\w.]+',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' ),
                                                                                            bless( {
                                                                                                     'description' => '/\\\\s*/',
                                                                                                     'hashname' => '__PATTERN5__',
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'mod' => '',
                                                                                                     'pattern' => '\\s*',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' ),
                                                                                            bless( {
                                                                                                     'argcode' => undef,
                                                                                                     'implicit' => undef,
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'matchrule' => 0,
                                                                                                     'subrule' => 'closing_tag'
                                                                                                   }, 'Parse::RecDescent::Subrule' ),
                                                                                            bless( {
                                                                                                     'description' => '/\\\\s*/',
                                                                                                     'hashname' => '__PATTERN6__',
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0,
                                                                                                     'mod' => '',
                                                                                                     'pattern' => '\\s*',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' ),
                                                                                            bless( {
                                                                                                     'code' => '{
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    if ( $item[1] =~ /\\n/ or $prev ) {
        if ( $item[8] =~ /\\n/ ) {
            $item[1] =~ s/(^|\\n)[ \\t]*?$/$1/;
            $item[8] =~ s/^.*?\\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }

    [ $item[5], $item[3] eq \'^\',
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] )
    ];
}',
                                                                                                     'hashname' => '__ACTION1__',
                                                                                                     'line' => 63,
                                                                                                     'lookahead' => 0
                                                                                                   }, 'Parse::RecDescent::Action' )
                                                                                          ],
                                                                               'line' => undef,
                                                                               'number' => 0,
                                                                               'patcount' => 6,
                                                                               'strcount' => 0,
                                                                               'uncommit' => undef
                                                                             }, 'Parse::RecDescent::Production' )
                                                                    ],
                                                         'vars' => ''
                                                       }, 'Parse::RecDescent::Rule' ),
                              'opening_tag' => bless( {
                                                        'calls' => [],
                                                        'changed' => 0,
                                                        'impcount' => 0,
                                                        'line' => 17,
                                                        'name' => 'opening_tag',
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'actcount' => 0,
                                                                              'dircount' => 0,
                                                                              'error' => undef,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'description' => '\'$thisparser->\\{opening_tag\\}\'',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'line' => 17,
                                                                                                    'lookahead' => 0,
                                                                                                    'pattern' => '$thisparser->{opening_tag}'
                                                                                                  }, 'Parse::RecDescent::InterpLit' )
                                                                                         ],
                                                                              'line' => undef,
                                                                              'number' => 0,
                                                                              'patcount' => 0,
                                                                              'strcount' => 1,
                                                                              'uncommit' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'vars' => ''
                                                      }, 'Parse::RecDescent::Rule' ),
                              'partial' => bless( {
                                                    'calls' => [
                                                                 'opening_tag',
                                                                 'closing_tag'
                                                               ],
                                                    'changed' => 0,
                                                    'impcount' => 0,
                                                    'line' => 41,
                                                    'name' => 'partial',
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'actcount' => 1,
                                                                          'dircount' => 0,
                                                                          'error' => undef,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'description' => '/\\\\s*/',
                                                                                                'hashname' => '__PATTERN1__',
                                                                                                'ldelim' => '/',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'mod' => '',
                                                                                                'pattern' => '\\s*',
                                                                                                'rdelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'argcode' => undef,
                                                                                                'implicit' => undef,
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'matchrule' => 0,
                                                                                                'subrule' => 'opening_tag'
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'description' => '\'>\'',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'pattern' => '>'
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'description' => '/\\\\s*/',
                                                                                                'hashname' => '__PATTERN2__',
                                                                                                'ldelim' => '/',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'mod' => '',
                                                                                                'pattern' => '\\s*',
                                                                                                'rdelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'description' => '/[\\\\/-\\\\w.]+/',
                                                                                                'hashname' => '__PATTERN3__',
                                                                                                'ldelim' => '/',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'mod' => '',
                                                                                                'pattern' => '[\\/-\\w.]+',
                                                                                                'rdelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'description' => '/\\\\s*/',
                                                                                                'hashname' => '__PATTERN4__',
                                                                                                'ldelim' => '/',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'mod' => '',
                                                                                                'pattern' => '\\s*',
                                                                                                'rdelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'argcode' => undef,
                                                                                                'implicit' => undef,
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'matchrule' => 0,
                                                                                                'subrule' => 'closing_tag'
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'description' => '/\\\\s*/',
                                                                                                'hashname' => '__PATTERN5__',
                                                                                                'ldelim' => '/',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0,
                                                                                                'mod' => '',
                                                                                                'pattern' => '\\s*',
                                                                                                'rdelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'code' => '{
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;
    my $indent = \'\';
    if ( $item[1] =~ /\\n/ or $prev ) {
        if ( $item[8] =~ /\\n/  or length $text == 0) {
            $item[1] =~ /(^|\\n)([ \\t]*?)$/;
            $indent = $2;
            $item[8] =~ s/^.*?\\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Partial->new( name => $item[5],
                indent => $indent ),
            Template::Mustache::Token::Verbatim->new( content => $item[8] ),
        ],
        )
}',
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'line' => 41,
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'line' => undef,
                                                                          'number' => 0,
                                                                          'patcount' => 5,
                                                                          'strcount' => 1,
                                                                          'uncommit' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'vars' => ''
                                                  }, 'Parse::RecDescent::Rule' ),
                              'section' => bless( {
                                                    'calls' => [
                                                                 'open_section',
                                                                 'inner_section',
                                                                 'close_section'
                                                               ],
                                                    'changed' => 0,
                                                    'impcount' => 0,
                                                    'line' => 121,
                                                    'name' => 'section',
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'actcount' => 3,
                                                                          'dircount' => 0,
                                                                          'error' => undef,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'argcode' => undef,
                                                                                                'implicit' => undef,
                                                                                                'line' => 121,
                                                                                                'lookahead' => 0,
                                                                                                'matchrule' => 0,
                                                                                                'subrule' => 'open_section'
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'code' => '{$thisoffset}',
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'line' => 121,
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' ),
                                                                                       bless( {
                                                                                                'argcode' => '[ $item[1][0] ]',
                                                                                                'expected' => undef,
                                                                                                'line' => 121,
                                                                                                'lookahead' => 0,
                                                                                                'matchrule' => 0,
                                                                                                'max' => 100000000,
                                                                                                'min' => 0,
                                                                                                'repspec' => 's?',
                                                                                                'subrule' => 'inner_section'
                                                                                              }, 'Parse::RecDescent::Repetition' ),
                                                                                       bless( {
                                                                                                'code' => '{$thisoffset
    - $item[2]
}',
                                                                                                'hashname' => '__ACTION2__',
                                                                                                'line' => 121,
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' ),
                                                                                       bless( {
                                                                                                'argcode' => '[ $item[1][0] ]',
                                                                                                'implicit' => undef,
                                                                                                'line' => 123,
                                                                                                'lookahead' => 0,
                                                                                                'matchrule' => 0,
                                                                                                'subrule' => 'close_section'
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'code' => '{
    my $raw = substr( $thisparser->{fulltext}, $item[2], $item[4] );
    Template::Mustache::Token::Template->new( items => [
        $item[1]->[2],
        Template::Mustache::Token::Section->new(
            delimiters => [ map { $thisparser->{$_} } qw/ opening_tag closing_tag / ],
            variable => $item[1][0],
            inverse => $item[1][1],
            raw => $raw,
            template => Template::Mustache::Token::Template->new( 
                items => [ 
                    $item[1][3], @{$item[3]}, $item[5][0] ], 
            )
        ),
        $item[5][1]
        ]
    );
}',
                                                                                                'hashname' => '__ACTION3__',
                                                                                                'line' => 123,
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'line' => undef,
                                                                          'number' => 0,
                                                                          'patcount' => 0,
                                                                          'strcount' => 0,
                                                                          'uncommit' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'vars' => ''
                                                  }, 'Parse::RecDescent::Rule' ),
                              'standalone_surround' => bless( {
                                                                'calls' => [
                                                                             'opening_tag',
                                                                             'closing_tag'
                                                                           ],
                                                                'changed' => 0,
                                                                'impcount' => 0,
                                                                'line' => 96,
                                                                'name' => 'standalone_surround',
                                                                'opcount' => 0,
                                                                'prods' => [
                                                                             bless( {
                                                                                      'actcount' => 1,
                                                                                      'dircount' => 0,
                                                                                      'error' => undef,
                                                                                      'items' => [
                                                                                                   bless( {
                                                                                                            'description' => '/\\\\s*/',
                                                                                                            'hashname' => '__PATTERN1__',
                                                                                                            'ldelim' => '/',
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0,
                                                                                                            'mod' => '',
                                                                                                            'pattern' => '\\s*',
                                                                                                            'rdelim' => '/'
                                                                                                          }, 'Parse::RecDescent::Token' ),
                                                                                                   bless( {
                                                                                                            'argcode' => undef,
                                                                                                            'implicit' => undef,
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0,
                                                                                                            'matchrule' => 0,
                                                                                                            'subrule' => 'opening_tag'
                                                                                                          }, 'Parse::RecDescent::Subrule' ),
                                                                                                   bless( {
                                                                                                            'description' => '/\\\\s*/',
                                                                                                            'hashname' => '__PATTERN2__',
                                                                                                            'ldelim' => '/',
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0,
                                                                                                            'mod' => '',
                                                                                                            'pattern' => '\\s*',
                                                                                                            'rdelim' => '/'
                                                                                                          }, 'Parse::RecDescent::Token' ),
                                                                                                   bless( {
                                                                                                            'argcode' => undef,
                                                                                                            'implicit' => undef,
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0,
                                                                                                            'matchrule' => 1,
                                                                                                            'subrule' => '$arg[0]_inner'
                                                                                                          }, 'Parse::RecDescent::Subrule' ),
                                                                                                   bless( {
                                                                                                            'argcode' => undef,
                                                                                                            'implicit' => undef,
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0,
                                                                                                            'matchrule' => 0,
                                                                                                            'subrule' => 'closing_tag'
                                                                                                          }, 'Parse::RecDescent::Subrule' ),
                                                                                                   bless( {
                                                                                                            'description' => '/\\\\s*/',
                                                                                                            'hashname' => '__PATTERN3__',
                                                                                                            'ldelim' => '/',
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0,
                                                                                                            'mod' => '',
                                                                                                            'pattern' => '\\s*',
                                                                                                            'rdelim' => '/'
                                                                                                          }, 'Parse::RecDescent::Token' ),
                                                                                                   bless( {
                                                                                                            'code' => '{
    my $prev = $thisparser->{prev_is_standalone};
    $thisparser->{prev_is_standalone} = 0;

    if ( $item[1] =~ /\\n/ or $prev) {
        if ( $item[6] =~ /\\n/  or length $text == 0) {
            $item[1] =~ s/(\\r?\\n?)\\s*?$/$1/;
            $item[6] =~ s/^.*?\\n//;
            $thisparser->{prev_is_standalone} = 1;
        }
    }

    [  @item[1,6,4] ],
}',
                                                                                                            'hashname' => '__ACTION1__',
                                                                                                            'line' => 96,
                                                                                                            'lookahead' => 0
                                                                                                          }, 'Parse::RecDescent::Action' )
                                                                                                 ],
                                                                                      'line' => undef,
                                                                                      'number' => 0,
                                                                                      'patcount' => 3,
                                                                                      'strcount' => 0,
                                                                                      'uncommit' => undef
                                                                                    }, 'Parse::RecDescent::Production' )
                                                                           ],
                                                                'vars' => ''
                                                              }, 'Parse::RecDescent::Rule' ),
                              'template' => bless( {
                                                     'calls' => [
                                                                  'template_item',
                                                                  'eofile'
                                                                ],
                                                     'changed' => 0,
                                                     'impcount' => 0,
                                                     'line' => 6,
                                                     'name' => 'template',
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'actcount' => 2,
                                                                           'dircount' => 0,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'code' => '{ my ($otag,$ctag) = @arg ? @arg : ( qw/ {{ }} / );
    $thisparser->{opening_tag} = $otag;
    $thisparser->{closing_tag} = $ctag;
    $thisparser->{prev_is_standalone} = 1;
    1;
}',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 6,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'expected' => undef,
                                                                                                 'line' => 11,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'max' => 100000000,
                                                                                                 'min' => 0,
                                                                                                 'repspec' => 's?',
                                                                                                 'subrule' => 'template_item'
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 11,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'eofile'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'code' => '{
    Template::Mustache::Token::Template->new(
        items => $item[2]
    );
}',
                                                                                                 'hashname' => '__ACTION2__',
                                                                                                 'line' => 11,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef,
                                                                           'number' => 0,
                                                                           'patcount' => 0,
                                                                           'strcount' => 0,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' ),
                                                                  bless( {
                                                                           'actcount' => 0,
                                                                           'dircount' => 1,
                                                                           'error' => 1,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'commitonly' => '',
                                                                                                 'hashname' => '__DIRECTIVE1__',
                                                                                                 'line' => 15,
                                                                                                 'lookahead' => 0,
                                                                                                 'msg' => ''
                                                                                               }, 'Parse::RecDescent::Error' )
                                                                                      ],
                                                                           'line' => 15,
                                                                           'number' => 1,
                                                                           'patcount' => 0,
                                                                           'strcount' => 0,
                                                                           'uncommit' => 0
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'vars' => ''
                                                   }, 'Parse::RecDescent::Rule' ),
                              'template_item' => bless( {
                                                          'calls' => [
                                                                       '_alternation_1_of_production_1_of_rule_template_item'
                                                                     ],
                                                          'changed' => 0,
                                                          'impcount' => 1,
                                                          'line' => 21,
                                                          'name' => 'template_item',
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'actcount' => 1,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => 'partial, or section, or delimiter_change, or comment, or unescaped_variable_amp, or unescaped_variable, or variable, or verbatim',
                                                                                                      'line' => 21,
                                                                                                      'lookahead' => 0,
                                                                                                      'matchrule' => 0,
                                                                                                      'subrule' => '_alternation_1_of_production_1_of_rule_template_item'
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'code' => '{
    $item[1]
}',
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'line' => 21,
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef,
                                                                                'number' => 0,
                                                                                'patcount' => 0,
                                                                                'strcount' => 0,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'vars' => ''
                                                        }, 'Parse::RecDescent::Rule' ),
                              'unescaped_variable' => bless( {
                                                               'calls' => [
                                                                            'opening_tag',
                                                                            'variable_name',
                                                                            'closing_tag'
                                                                          ],
                                                               'changed' => 0,
                                                               'impcount' => 0,
                                                               'line' => 142,
                                                               'name' => 'unescaped_variable',
                                                               'opcount' => 0,
                                                               'prods' => [
                                                                            bless( {
                                                                                     'actcount' => 1,
                                                                                     'dircount' => 0,
                                                                                     'error' => undef,
                                                                                     'items' => [
                                                                                                  bless( {
                                                                                                           'description' => '/\\\\s*/',
                                                                                                           'hashname' => '__PATTERN1__',
                                                                                                           'ldelim' => '/',
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'mod' => '',
                                                                                                           'pattern' => '\\s*',
                                                                                                           'rdelim' => '/'
                                                                                                         }, 'Parse::RecDescent::Token' ),
                                                                                                  bless( {
                                                                                                           'argcode' => undef,
                                                                                                           'implicit' => undef,
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'matchrule' => 0,
                                                                                                           'subrule' => 'opening_tag'
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'description' => '\'\\{\'',
                                                                                                           'hashname' => '__STRING1__',
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'pattern' => '{'
                                                                                                         }, 'Parse::RecDescent::Literal' ),
                                                                                                  bless( {
                                                                                                           'description' => '/\\\\s*/',
                                                                                                           'hashname' => '__PATTERN2__',
                                                                                                           'ldelim' => '/',
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'mod' => '',
                                                                                                           'pattern' => '\\s*',
                                                                                                           'rdelim' => '/'
                                                                                                         }, 'Parse::RecDescent::Token' ),
                                                                                                  bless( {
                                                                                                           'argcode' => undef,
                                                                                                           'implicit' => undef,
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'matchrule' => 0,
                                                                                                           'subrule' => 'variable_name'
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'description' => '/\\\\s*/',
                                                                                                           'hashname' => '__PATTERN3__',
                                                                                                           'ldelim' => '/',
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'mod' => '',
                                                                                                           'pattern' => '\\s*',
                                                                                                           'rdelim' => '/'
                                                                                                         }, 'Parse::RecDescent::Token' ),
                                                                                                  bless( {
                                                                                                           'description' => '\'\\}\'',
                                                                                                           'hashname' => '__STRING2__',
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'pattern' => '}'
                                                                                                         }, 'Parse::RecDescent::Literal' ),
                                                                                                  bless( {
                                                                                                           'argcode' => undef,
                                                                                                           'implicit' => undef,
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0,
                                                                                                           'matchrule' => 0,
                                                                                                           'subrule' => 'closing_tag'
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'code' => '{
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( 
                name => $item{variable_name},
                escape => 0,
            ),
        ]
    );
}',
                                                                                                           'hashname' => '__ACTION1__',
                                                                                                           'line' => 142,
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Action' )
                                                                                                ],
                                                                                     'line' => undef,
                                                                                     'number' => 0,
                                                                                     'patcount' => 3,
                                                                                     'strcount' => 2,
                                                                                     'uncommit' => undef
                                                                                   }, 'Parse::RecDescent::Production' )
                                                                          ],
                                                               'vars' => ''
                                                             }, 'Parse::RecDescent::Rule' ),
                              'unescaped_variable_amp' => bless( {
                                                                   'calls' => [
                                                                                'opening_tag',
                                                                                'variable_name',
                                                                                'closing_tag'
                                                                              ],
                                                                   'changed' => 0,
                                                                   'impcount' => 0,
                                                                   'line' => 154,
                                                                   'name' => 'unescaped_variable_amp',
                                                                   'opcount' => 0,
                                                                   'prods' => [
                                                                                bless( {
                                                                                         'actcount' => 1,
                                                                                         'dircount' => 0,
                                                                                         'error' => undef,
                                                                                         'items' => [
                                                                                                      bless( {
                                                                                                               'description' => '/\\\\s*/',
                                                                                                               'hashname' => '__PATTERN1__',
                                                                                                               'ldelim' => '/',
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'mod' => '',
                                                                                                               'pattern' => '\\s*',
                                                                                                               'rdelim' => '/'
                                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                                      bless( {
                                                                                                               'argcode' => undef,
                                                                                                               'implicit' => undef,
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'matchrule' => 0,
                                                                                                               'subrule' => 'opening_tag'
                                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                                      bless( {
                                                                                                               'description' => '\'&\'',
                                                                                                               'hashname' => '__STRING1__',
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'pattern' => '&'
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'description' => '/\\\\s*/',
                                                                                                               'hashname' => '__PATTERN2__',
                                                                                                               'ldelim' => '/',
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'mod' => '',
                                                                                                               'pattern' => '\\s*',
                                                                                                               'rdelim' => '/'
                                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                                      bless( {
                                                                                                               'argcode' => undef,
                                                                                                               'implicit' => undef,
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'matchrule' => 0,
                                                                                                               'subrule' => 'variable_name'
                                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                                      bless( {
                                                                                                               'description' => '/\\\\s*/',
                                                                                                               'hashname' => '__PATTERN3__',
                                                                                                               'ldelim' => '/',
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'mod' => '',
                                                                                                               'pattern' => '\\s*',
                                                                                                               'rdelim' => '/'
                                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                                      bless( {
                                                                                                               'argcode' => undef,
                                                                                                               'implicit' => undef,
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0,
                                                                                                               'matchrule' => 0,
                                                                                                               'subrule' => 'closing_tag'
                                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                                      bless( {
                                                                                                               'code' => '{
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( 
                name => $item{variable_name},
                escape => 0,
            ),
        ]
    );
}',
                                                                                                               'hashname' => '__ACTION1__',
                                                                                                               'line' => 154,
                                                                                                               'lookahead' => 0
                                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                                    ],
                                                                                         'line' => undef,
                                                                                         'number' => 0,
                                                                                         'patcount' => 3,
                                                                                         'strcount' => 1,
                                                                                         'uncommit' => undef
                                                                                       }, 'Parse::RecDescent::Production' )
                                                                              ],
                                                                   'vars' => ''
                                                                 }, 'Parse::RecDescent::Rule' ),
                              'variable' => bless( {
                                                     'calls' => [
                                                                  'opening_tag',
                                                                  'variable_name',
                                                                  'closing_tag'
                                                                ],
                                                     'changed' => 0,
                                                     'impcount' => 0,
                                                     'line' => 167,
                                                     'name' => 'variable',
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'actcount' => 1,
                                                                           'dircount' => 0,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'description' => '/\\\\s*/',
                                                                                                 'hashname' => '__PATTERN1__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '\\s*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'opening_tag'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'description' => '/\\\\s*/',
                                                                                                 'hashname' => '__PATTERN2__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '\\s*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'variable_name'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'description' => '/\\\\s*/',
                                                                                                 'hashname' => '__PATTERN3__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '\\s*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'closing_tag'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'code' => '{
    $thisparser->{prev_is_standalone} = 0;
    Template::Mustache::Token::Template->new(
        items => [
            Template::Mustache::Token::Verbatim->new( content => $item[1] ),
            Template::Mustache::Token::Variable->new( name => $item{variable_name} ),
        ]
    );
}',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 167,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef,
                                                                           'number' => 0,
                                                                           'patcount' => 3,
                                                                           'strcount' => 0,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'vars' => ''
                                                   }, 'Parse::RecDescent::Rule' ),
                              'variable_name' => bless( {
                                                          'calls' => [],
                                                          'changed' => 0,
                                                          'impcount' => 0,
                                                          'line' => 177,
                                                          'name' => 'variable_name',
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '/[-\\\\w.]+/',
                                                                                                      'hashname' => '__PATTERN1__',
                                                                                                      'ldelim' => '/',
                                                                                                      'line' => 177,
                                                                                                      'lookahead' => 0,
                                                                                                      'mod' => '',
                                                                                                      'pattern' => '[-\\w.]+',
                                                                                                      'rdelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' )
                                                                                           ],
                                                                                'line' => undef,
                                                                                'number' => 0,
                                                                                'patcount' => 1,
                                                                                'strcount' => 0,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'vars' => ''
                                                        }, 'Parse::RecDescent::Rule' ),
                              'verbatim' => bless( {
                                                     'calls' => [],
                                                     'changed' => 0,
                                                     'impcount' => 0,
                                                     'line' => 179,
                                                     'name' => 'verbatim',
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'actcount' => 2,
                                                                           'dircount' => 0,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'code' => '{ $thisparser->{opening_tag} }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 179,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' ),
                                                                                        bless( {
                                                                                                 'description' => '/^\\\\s*\\\\S*?(?=\\\\Q$item[1]\\\\E|\\\\s|$)/',
                                                                                                 'hashname' => '__PATTERN1__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 179,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '^\\s*\\S*?(?=\\Q$item[1]\\E|\\s|$)',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'code' => '{
    $thisparser->{prev_is_standalone} = 0;
    Template::Mustache::Token::Verbatim->new( content => $item[2] );
}',
                                                                                                 'hashname' => '__ACTION2__',
                                                                                                 'line' => 179,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef,
                                                                           'number' => 0,
                                                                           'patcount' => 1,
                                                                           'strcount' => 0,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'vars' => ''
                                                   }, 'Parse::RecDescent::Rule' )
                            },
                 'skip' => 'qr//',
                 'startcode' => ''
               }, 'Parse::RecDescent' );
}

__END__

=pod

=encoding UTF-8

=head1 NAME

Template::Mustache::Parser

=head1 VERSION

version 1.3.1

=head1 AUTHORS

=over 4

=item *

Pieter van de Bruggen <pvande@cpan.org>

=item *

Yanick Champoux <yanick@cpan.org>

=item *

Ricardo Signes <rjbs@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2018, 2017, 2016, 2015, 2011 by Pieter van de Bruggen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

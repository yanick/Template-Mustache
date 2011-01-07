#!/usr/bin/perl

use Benchmark;
use Template::Mustache;

timethese(1_000_000,{
    "Plain String (No Interpolation)" => <<'    PERL',
        Template::Mustache->render(<<'        MUSTACHE');
            I am the very model of a modern Major-General,
            I've information vegetable, animal, and mineral,
            I know the kings of England, and I quote the fights historical
            From Marathon to Waterloo, in order categorical;
            I'm very well acquainted, too, with matters mathematical,
            I understand equations, both the simple and quadratical,
            About binomial theorem I'm teeming with a lot o' news,
            With many cheerful facts about the square of the hypotenuse.
        MUSTACHE
    PERL
    "Simple Interpolation" => <<'    PERL',
        my $data = {
            title => 'Major-General',
            info  => [
                { kind => 'vegetable' },
                { kind => 'animal' },
                { kind => 'mineral', conjunction => 1 },
            ],
            country => 'England',
            order   => 'categorical',
            degree  => 'very well',
            advanced_topic => 'binomial theorem',
            gerund  => 'teeming',
            subject => 'the square of the hypotenuse',
        };
        Template::Mustache->render(<<'        MUSTACHE', $data);
            I am the very model of a modern {{title}},
            I've information {{#info}}{{#conjunction}}and {{/conjunction}}{{kind}},{{/info}}
            I know the kings of {{country}}, and I quote the fights historical
            From Marathon to Waterloo, in order {{order}};
            I'm {{degree}} acquainted, too, with matters mathematical,
            I understand equations, both the simple and quadratical,
            About {{advanced_topic}} I'm {{gerund}} with a lot o' news,
            With many cheerful facts about {{subject}}.
        MUSTACHE
    PERL
    "Complex Templates" => <<'    PERL',
        my $data = {
            what => "the song that doesn't end",
            who  => "Some people",
            why  => "Just because",
            last => 0,
        };
        Template::Mustache->render(<<'        MUSTACHE', $data);
            {{^last}}
                This is {{what}},
                Yes, it goes on and on my friend;
                {{who}} started singing it,
                Not knowing what it was --
                And they'll continue singing it forever
                {{why}}
                This is {{what}},
                Yes, it goes on and on my friend;
                {{who}} started singing it,
                Not knowing what it was --
                And they'll continue singing it forever
                {{why}}
                This is {{what}},
                Yes, it goes on and on my friend;
                {{who}} started singing it,
                Not knowing what it was --
                And they'll continue singing it forever
                {{why}}
            {{/last}}
            {{#last}}
                This is {{what}},
                Until I'm done.
            {{/last}}
        MUSTACHE
    PERL
    "Recursive Templates" => <<'    PERL',
        my $repetitions = 1000;
        my $data = {
            what => "the song that doesn't end",
            who  => "Some people",
            why  => "Just because",
            last => sub { $repetitions-- },
        };
        my $partials = {
            verse => "This is {{what}},
            Yes, it goes on and on my friend;
            {{who}} started singing it,
            Not knowing what it was --
            And they'll continue singing it forever
            {{why}}
            {{^last}}{{> verse}}{{/last}}",
        };
        Template::Mustache->render(<<'        MUSTACHE', $data, $partials);
            {{> verse}}
            This is {{what}},
            Until I'm done.
        MUSTACHE
    PERL
    "Self-Parsing" => <<'    PERL',
        open FILE, 'benchmark.pl';
        sysread(FILE, my $template, -s FILE);
        close FILE;
        Template::Mustache->render($template);
    PERL
});

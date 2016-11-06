use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;
use ExtUtils::Manifest  1.56;

my $SKIP_FILES = <<SKIP;
SKIP

my %WriteMakefileArgs = (
    'NAME'       => 'Template::Mustache',
    'ABSTRACT'   => 'Drawing Mustaches on Perl for fun and profit',
    'VERSION'    => 'v0.5.4',
    'AUTHOR'     => 'Pieter van de Bruggen <pvande@cpan.org>',
    'LICENSE'    => 'perl',
    'MIN_PERL_VERSION' => '5.8.0',
    'META_MERGE' => {
        'resources' => {
            'homepage'   => 'https://github.com/pvande/Template-Mustache',
            'repository' => 'git://github.com/pvande/Template-Mustache.git',
            'bugtracker' => 'https://github.com/pvande/Template-Mustache/issues',
        },
    },
    'PREREQ_PM' => {
        'version' => '0.77',
        'HTML::Entities' => 0,
        'namespace::clean' => 0,
    },
    'BUILD_REQUIRES' => {
        'YAML::Syck'       => '1.15',
    },
    'CONFIGURE_REQUIRES' => {
         'ExtUtils::MakeMaker' => '6.31',
         'ExtUtils::Manifest'  => '1.56',
    },
    'test' => {
        'TESTS' => 't/*.t',
    },
    'EXE_FILES' => ['bin/mustache.pl'],
);

unless (eval { ExtUtils::MakeMaker->VERSION(6.56) }) {
    my $REQS = delete $WriteMakefileArgs{BUILD_REQUIRES};
    $WriteMakefileArgs{PREREQ_PM}->{$_} = $REQS->{$_} for keys %$REQS;
}

unless (eval { ExtUtils::MakeMaker->VERSION(6.52) }) {
    my $REQS = delete $WriteMakefileArgs{CONFIGURE_REQUIRES};
    $WriteMakefileArgs{PREREQ_PM}->{$_} = $REQS->{$_} for keys %$REQS;
}


# Write the new Makefile.
WriteMakefile(%WriteMakefileArgs);

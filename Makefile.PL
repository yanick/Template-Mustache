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
    'VERSION'    => 'v0.0.2',
    'AUTHOR'     => 'Pieter van de Bruggen <pvande@cpan.org>',
    'LICENSE'    => 'perl',
    'META_MERGE' => {
        'resources' => {
            'homepage'   => 'https://github.com/pvande/Template-Mustache',
            'repository' => 'git://github.com/pvande/Template-Mustache.git',
            'bugtracker' => 'https://github.com/pvande/Template-Mustache/issues',
        },
    },
    'PREREQ_PM' => {
    },
    'BUILD_REQUIRES' => {
        'Test::Mini::Unit' => 'v1.0.0',
        'YAML::Syck'       => '1.15',
    },
    'CONFIGURE_REQUIRES' => {
         'ExtUtils::MakeMaker' => '6.31',
         'ExtUtils::Manifest'  => '1.56',
    },
#   'DIST_REQUIRES' => {
#       'ShipIt'                 => '0.55',
#   },
    'test' => {
        'TESTS' => 't/*.t',
    },
    'dist' => {
        'PREOP'  => 'RUBYLIB=:../yard-perl-plugin/lib:../yard-pod-plugin/lib yard -e yard-perl-plugin.rb -e yard-pod-plugin.rb',
        'POSTOP' => 'make realclean; rm MANIFEST',
    },
);

delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

(my $DISTNAME = $WriteMakefileArgs{NAME}) =~ s/::/-/g;
my $DISTDIR = "$DISTNAME-$WriteMakefileArgs{VERSION}";
my $LIBDIR = "$DISTDIR/lib";
$WriteMakefileArgs{dist}->{PREOP} .= " -o $LIBDIR; ";
$WriteMakefileArgs{dist}->{PREOP} .= "(cd $DISTDIR; find lib -name '*.pod' -type f >> MANIFEST)";

# Create a MANIFEST.SKIP file.
open(GITIGNORE, '<.gitignore');
open(SKIP, '>MANIFEST.SKIP');
print SKIP "#!include_default\n";
print SKIP "MANIFEST.SKIP.*\n";
print SKIP "^$DISTNAME.*\n";
print SKIP "^\\..*\n";
print SKIP <GITIGNORE>;
print SKIP $SKIP_FILES;
close SKIP;
close GITIGNORE;

# Create a new MANIFEST.
ExtUtils::Manifest::mkmanifest();

# Write the new Makefile.
WriteMakefile(%WriteMakefileArgs);

# Cleanup the MANIFEST.SKIP files.
unlink glob 'MANIFEST.{,SKIP}*';

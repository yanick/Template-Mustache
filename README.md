Template::Mustache
==================

[![Build Status](https://travis-ci.org/pvande/Template-Mustache.svg?branch=master)](https://travis-ci.org/pvande/Template-Mustache)

Template::Mustache is a port of the
[Mustache](https://github.com/mustache/mustache) templating language to Perl.

## Installation

### Via CPAN

The simplest installation option is to simply use `cpanm`:

    $ cpanm Template::Mustache

### From source

When building and installing from source, first get the source code:

    $ git clone https://github.com/pvande/Template-Mustache.git

Then change into the `Template-Mustache` directory and install the
distribution's dependencies:

    $ cd Template-Mustache
    $ cpanm --installdeps .

After that, build and test the distribution, before finally installing it:

    $ make
    $ make test
    $ make install

use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'evernotecli',
    AUTHOR              => q{Fernando Corrêa de Oliveira <fco@cpan.org>},
    VERSION_FROM        => 'lib/evernotecli.pm',
    ABSTRACT_FROM       => 'lib/evernotecli.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    EXE_FILES		=> [qw{bin/evernote-cli}],
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'evernotecli-*' },
);

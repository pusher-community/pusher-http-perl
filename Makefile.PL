use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WWW::Pusher',
    AUTHOR              => q{Squeeks <squeek@cpan.org>},
    VERSION_FROM        => 'lib/WWW/Pusher.pm',
    ABSTRACT_FROM       => 'lib/WWW/Pusher.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    
    PREREQ_PM => {
        'Test::More'     => 0,
	'LWP'            => 0,
	'URI'            => 0,
	'JSON'           => 2.00,
	'Digest::MD5'    => 2.39,
	'Digest::SHA'    => 5.48
    },

    MIN_PERL_VERSION => '5.008',

    META_MERGE => {
	resources => {
            repository => 'http://github.com/squeeks/WWW-Pusher'
	}
    },

    test      		=> { TESTS => join( ' ', (glob( 't/*.t'), glob('t/*/*.t'))) },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WWW::Pusher-*' },
);

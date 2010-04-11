#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::Pusher' ) || print "Bail out!
";
}

diag('');
diag('');
diag("In order to test this against pusherapp.com's servers, ");
diag("Set the environment variable PUSHERAPP_APIKEY to your ");
diag("API key, available at http://pusherapp.com/signup.");
diag('');
diag( "Testing WWW::Pusher $WWW::Pusher::VERSION, Perl $], $^X" );

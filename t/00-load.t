#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::Pusher' ) || print "Bail out!
";
}

unless( $ENV{PUSHERAPP_AUTHKEY} && $ENV{PUSHERAPP_APPID} && $ENV{PUSHERAPP_SECRET} )
{
	diag('');
	diag('');
	diag("In order to test this against pusherapp.com's servers, ");
	diag("Set the following environment variable to your account settings:");
	diag("PUSHERAPP_AUTHKEY - Authentication Key");
	diag("PUSHERAPP_APPKEY  - Application ID");
	diag("PUSHERAPP_SECRET  - Secret");
	diag("If you have an account, these will be located at http://pusherapp.com/dashboard");
	diag('');
}

diag( "Testing WWW::Pusher $WWW::Pusher::VERSION, Perl $], $^X" );

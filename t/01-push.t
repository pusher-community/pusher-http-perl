#!perl -T

use Test::More;

unless ( $ENV{PUSHERAPP_AUTHKEY} && $ENV{PUSHERAPP_APPID} && $ENV{PUSHERAPP_SECRET})
{
    plan( skip_all => "pusherapp.con API key not found, skipping..." );
}

use_ok('WWW::Pusher');

my $pusher = WWW::Pusher->new(
	auth_key => $ENV{PUSHERAPP_AUTHKEY},
	app_id   => $ENV{PUSHERAPP_APPID}, 
	secret   => $ENV{PUSHERAPP_SECRET}, 
	channel  => 'test_channel');

ok($pusher, 'Created new WWW::Pusher object');

my $time = scalar localtime;
$pusher_response = $pusher->trigger(event =>'my_event', data =>'Testing WWW::Pusher at '.$time);
is($pusher_response, '1', 'Sent trigger to pusher');

done_testing();

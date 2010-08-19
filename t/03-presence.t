#!perl -T

use Test::More tests => 3;

use_ok('WWW::Pusher');

my $pusher = WWW::Pusher->new(
	debug    => 1, 
	auth_key => 'thisisaauthkey',
	app_id   => '1', 
	secret   => 'thisisasecret', 
	channel  => 'testing_www-pusher');

ok($pusher, 'Created new WWW::Pusher object');

my $auth = $pusher->presence_auth( socket_id => 'testing_socket_auth', user_id => 'foobar' );
is($auth, q({"auth":"thisisaauthkey:403b83237c2af04fdc28a03143a340b01cfa60dadcf6acbf695f04bcc16f1793"}), 'Generated socket_auth');

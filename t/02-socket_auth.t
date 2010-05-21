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

$auth = $pusher->socket_auth('testing_socket_auth');
is($auth, q({"auth":"thisisaauthkey:b6267e137ee863cca9349fcba866b82fb62a486f3d56d16dadf38c50593aa57f"}), 'Generated socket_auth');


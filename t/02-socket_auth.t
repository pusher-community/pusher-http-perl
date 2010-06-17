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
is($auth, q({"auth":"thisisaauthkey:2e5bce5a9e49d30f02d295834b4de9a33b0cb129fc4e3c26fc131b3ac97e7da1"}), 'Generated socket_auth');


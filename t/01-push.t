#!perl -T

use Test::More;

unless ( $ENV{PUSHERAPP_APIKEY} )
{
    plan( skip_all => "pusherapp.con API key not found, skipping..." );
}

use_ok('WWW::Pusher');

my $pusher = WWW::Pusher->new(key => $ENV{PUSHERAPP_APIKEY}, id => 'test_channel');
ok($pusher, 'Created new WWW::Pusher object');

my $time = scalar localtime;
$pusher_response = $pusher->trigger(event =>'my_event', data =>'Testing WWW::Pusher at '.$time);
is($pusher_response, 'OK', 'Sent trigger to pusher');

done_testing();

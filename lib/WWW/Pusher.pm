package WWW::Pusher;

use warnings;
use strict;

use 5.008;

use JSON;
use URI;
use LWP::UserAgent;

my $pusher_defaults = {
	host => 'http://api.pusherapp.com',
	port => 80
};

=head1 NAME

WWW::Pusher - Interface to the Pusher WebSockets API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use WWW::Pusher;

    my $pusher   = WWW::Pusher->new(key => 'YOUR API KEY', channel => 'test_channel');
    my $response = $pusher->trigger(event => 'my_event', data => 'Hello, World!');

=head1 METHODS

=head2 new(key => $api_key, channel => $channel_id, [ host => $host, port => $port, debug => 1 ])

Creates a new WWW::Pusher object. Both API key and Channel are mandatory.

You can optionally specify the host and port keys and override using pusherapp.com's 
server if you wish. Setting debug to a true value will return an L<LWP::UserAgent> response object 
in the event a trigger fails.

=cut

sub new
{
	my ($class, %args) = @_;
	
	die 'Pusher API key must be defined' unless $args{key};

	my $self = {
		uri	=> URI->new($pusher_defaults->{host} || $args{host}),
		lwp	=> LWP::UserAgent->new,
		host	=> $args{host} || $pusher_defaults->{host},
		port	=> $args{port} || $pusher_defaults->{port},
		key	=> $args{key},
		channel	=> $args{id}
	};

	$self->{uri}->port($self->{port});
	$self->{uri}->path('/app/'.$self->{key}.'/channel/'.$self->{channel});

	return bless $self;

}


=head2 trigger(event => $event_name, data => $data, [socket_id => $socket_id, debug => 1])

Send an event to the channel. The event name should be a scalar, but data could in theory be a hash/arrayref.

Returns "OK" on success, or undef on failure. Setting "debug" to a true value will return an L<LWP::UserAgent> 
response object.

=cut

sub trigger
{
	my ($self, %args) = @_;

	my $payload  = encode_json({ event => $args{event}, data  => $args{data} });
	my $request  = HTTP::Request->new('POST', $self->{uri}->as_string, ['Content-Type' => 'application/json'], $payload);
	my $response = $self->{lwp}->request($request);

	if($response->is_success)
	{
		return $response->content;
	}
	else
	{
		if($self->{debug} || $args{debug})
		{
			return $response;
		}
		else
		{
			return undef;
		}
	}
}

=head1 AUTHOR

Squeeks, C<< <squeek at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www::pusher at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW::Pusher>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Pusher


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW::Pusher>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW::Pusher>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW::Pusher>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW::Pusher/>

=back

=head1 SEE ALSO

Pusher - L<http://pusherapp.com>

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Squeeks.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of WWW::Pusher
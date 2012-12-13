#!/usr/bin/env perl

use lib "lib";
use Scalar::Util qw/blessed/;
local $SIG{__DIE__} = sub {
	my $err = shift;
	print STDERR blessed $err ? $err->{parameter} : $err;
};
use ENClient;
use App::Rad;
use File::HomeDir;
use HTML::Entities;
use HTML::Escape qw/escape_html/;

App::Rad->run;

sub setup {
	my $c = shift;
	my $home = File::HomeDir->my_home;
	$c->register(run 	=> \&run);
	$c->register(text 	=> \&text);
	$c->register(man 	=> \&man);

	$c->load_config("$home/.evernoteclirc");
	die "Please, get a auth token on https://sandbox.evernote.com/api/DeveloperToken.action (if you want to test on a sandbox) and fill the auth_token field on your conf file." unless exists $c->config->{auth_token};
	$c->stash->{auth_token} = $c->config->{auth_token};
}

sub run :Help(Send the return of a command to evernote) {
	my $c = shift;
	my $command = join " ", @ARGV;
	my $return  = qx/$command/;
	_create_note($c->stash->{auth_token}, $command, $return)
}

sub man :Help(Send the man page to evernote) {
	my $c = shift;
	my $command = shift @ARGV;
	my $return  = qx/man -P cat $command/;
	_create_note($c->stash->{auth_token}, "man $command", $return)
}

sub text :Help(Send the stdio to evernote) {
	my $c = shift;
	my $title = join " ", @ARGV;
	@ARGV = ();
	my $body;
	while(my $line = <>) {
		#last if $line =~ /^\n*$/;
		$body .= $line;
	}
	print "OK$/";
	_create_note($c->stash->{auth_token}, $title, $body)
}

sub _create_note {
	my $auth_token = shift;
	my $title = shift;
	my $body  = decode_entities(shift);
	my @files = @_;

	$body =~ s/\x{008}//g;
	$body = escape_html($body);
	my $enclient = ENClient->new;
	die "Late version..." if not $enclient->check_version;

	$enclient->auth_token($auth_token);
	
	my $note = EDAMTypes::Note->new();
	
	$note->title( $title );
	
	$note->content(<<"FIM");
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note>
  <pre style="background-color: black; color: green; font-family: 'Courier New', Courier, monospace">
$body
  </pre>
</en-note>
FIM
	my $created_note = $enclient->note_store->createNote( $enclient->auth_token, $note );
	sprintf "Successfully created a new note with GUID: %s\n", $created_note->guid;
}

use App::Rad;
use ENClient;

App::Rad->run;

sub setup {
	my $c = shift;
	$c->register(run 	=> \&run);
	$c->register(history 	=> \&history);
	$c->load_config("$ENV{HOME}/.evernoteclirc");
	die "Please, get a auth token on https://sandbox.evernote.com/api/DeveloperToken.action (if you want to test on a sandbox) and fill the auth_token field on your conf file." unless exists $c->config->{auth_token};
	$c->stash->{auth_token} = $c->config->{auth_token};
}

sub run :Help(Send the return of a command to evernote) {
	my $c = shift;
	my $command = join " ", @ARGV;
	my $return  = qx/$command/;
	_create_note($c->stash->{auth_token}, $command, $return)
}

sub _create_note {
	my $auth_token = shift;
	my $title = shift;
	my $body  = shift;
	my @files = @_;

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

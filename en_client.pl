use ENClient;

eval {
  local $SIG{__DIE__} = sub {
      my ( $err ) = @_;
      if ( not ( blessed $err && $err->isa('Exception::Class::Base') ) ) {
          EDAMTest::Exception::ExceptionWrapper->throw( error => $err );
      }
  };
  
  my $enclient = ENClient->new;
  die "Late version..." if not $enclient->check_version;
  
  my $note = EDAMTypes::Note->new();
  
  $note->title( "Test of model note" );
  
  $note->content(<<"FIM");
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note>
  <div>Here is the Evernote logo:</div>
  <table border="1">
    <tr>
      <td>Logo...</td>
      <td><a href="http://127.0.0.1:4000/">Create new note</a></td>
    </tr>
  </table>
  
</en-note>
FIM
  
  my $created_note = $enclient->note_store->createNote( $enclient->auth_token, $note );
  
  my $id = $created_note->{guid};
  $created_note->content(<<"FIM");
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
<en-note>
  <div>Here is the Evernote logo:</div>
  <table border="1">
    <tr>
      <td>Logo...</td>
      <td><a href="http://127.0.0.1:4000/$id/">Create new note</a></td>
    </tr>
  </table>
  
</en-note>
FIM
  
  $enclient->note_store->updateNote( $enclient->auth_token, $created_note );
  
  printf "Successfully created a new note with GUID: %s\n", $created_note->guid;
};
if ( my $err = $@ ) {
    print STDERR "[ERROR]\n";
    if ( blessed $err->error ) {
        print STDERR "=== Error object ===\n";
        local $Data::Dumper::Indent = 1;
        print STDERR Dumper( $err->error );
    } else {
        print STDERR "=== Error message ===\n";
        print STDERR $err->error, "\n";
    }
    print STDERR "=== Stack trace ===\n";
    print STDERR $err->trace->as_string;
    exit 1;
}

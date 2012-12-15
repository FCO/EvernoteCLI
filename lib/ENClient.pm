use IO::File;
use Digest::MD5;
use Data::Dumper;
use Scalar::Util qw( blessed );
use Exception::Class (
    'EDAMTest::Exception::ExceptionWrapper',
    'EDAMTest::Exception::FileIOError',
);

use LWP::Protocol::https;
use Thrift::HttpClient;
use Thrift::BinaryProtocol;
use EDAMTypes::Types;
use EDAMErrors::Types;
use EDAMUserStore::UserStore;
use EDAMNoteStore::NoteStore;
use EDAMUserStore::Constants;

package ENClient;
use Moose;

has auth_token => (
	is	=> 'rw',
	isa	=> 'Str',
	#default	=> 'S=s1:U=3fdec:E=142990dbfb2:C=13b415c93b2:P=1cd:A=en-devtoken:H=d6d57b8ff716b16454bb7806dd5fc74b',
);

has evernote_host => (
	is	=> 'rw',
	isa	=> 'Str',
	default	=> 'sandbox.evernote.com',
);

has user_store_url => (
	is	=> 'rw',
	isa	=> 'Str',
	default	=> sub{
		my $self = shift;
		'https://' . $self->evernote_host . '/edam/user'
	},
	lazy	=> 1,
);

has user_store_client => (
	is	=> 'rw',
	isa	=> 'Thrift::HttpClient',
	default	=> sub{
		my $self = shift;
		my $obj = Thrift::HttpClient->new( $self->user_store_url );
    		$obj->setSendTimeout( 2000 );
    		$obj->setRecvTimeout( 10000 );
		$obj
	},
	lazy	=> 1,
);

has user_store_prot => (
	is	=> 'rw',
	isa	=> 'Thrift::BinaryProtocol',
	default	=> sub{
		my $self = shift;
		Thrift::BinaryProtocol->new( $self->user_store_client );
	},
	lazy	=> 1,
);
has user_store => (
	is	=> 'rw',
	isa	=> 'EDAMUserStore::UserStoreClient',
	default	=> sub{
		my $self = shift;
		EDAMUserStore::UserStoreClient->new( $self->user_store_prot, $self->user_store_prot );
	},
	lazy	=> 1,
);

has note_store_url => (
	is	=> 'rw',
	isa	=> 'Str',
	default => sub{
		my $self = shift;
		$self->user_store->getNoteStoreUrl( $self->auth_token );
	},
	lazy	=> 1,
);


has note_store_client => (
	is	=> 'rw',
	isa	=> 'Object',
	default	=> sub{
		my $self = shift;
		my $obj = Thrift::HttpClient->new( $self->note_store_url );
    		$obj->setSendTimeout( 2000 );
    		$obj->setRecvTimeout( 10000 );
		$obj
	},
	lazy	=> 1,
);

has note_store_prot => (
	is	=> 'rw',
	isa	=> 'Thrift::BinaryProtocol',
	default	=> sub{
		my $self = shift;
		Thrift::BinaryProtocol->new( $self->note_store_client );
	},
	lazy	=> 1,
);

has note_store => (
	is	=> 'rw',
	isa	=> 'EDAMNoteStore::NoteStoreClient',
	default	=> sub{
		my $self = shift;
		EDAMNoteStore::NoteStoreClient->new( $self->note_store_prot, $self->note_store_prot );
	},
	lazy	=> 1,
);

has note_filter => (
	is	=> 'rw',
	isa	=> 'EDAMNoteStore::NoteFilter',
	default	=> sub{
		my $self = shift;
		my $filter = EDAMNoteStore::NoteFilter->new;
		$filter->order(EDAMTypes::NoteSortOrder::UPDATED);
		$filter
	},
	lazy	=> 1,
);

sub get_note {
	my $self = shift;
	my $guid = shift;
	$self->note_store->getNote($self->auth_token, $guid, 1)
}

sub check_version {
    my $self = shift;
    my $version_ok = $self->user_store->checkVersion(
        'Evernote EDAMTest (Perl)',
        EDAMUserStore::Constants::EDAM_VERSION_MAJOR,
        EDAMUserStore::Constants::EDAM_VERSION_MINOR
    );
    $version_ok
};

sub search {
	my $self       = shift;
	my $search_str = shift;
	my @notes;

	my $spec = EDAMNoteStore::NotesMetadataResultSpec->new;
	$spec->includeTitle(1);

	$self->note_filter->words($search_str);
	my $notes = $self->note_store->findNotesMetadata($self->auth_token, $self->note_filter, scalar(@notes), 10, $spec);
	push @notes, @{ $notes->notes } while $notes->totalNotes > @notes;
	@notes
}

42;


package ENResource;
use lib "lib";
use MIME::Types;
use Moose;
use Digest::MD5;
use Scalar::Util qw( blessed );
use Exception::Class (
    'EDAMTest::Exception::ExceptionWrapper',
    'EDAMTest::Exception::FileIOError',
);
use Thrift::HttpClient;
use Thrift::BinaryProtocol;
use EDAMTypes::Types;
use EDAMErrors::Types;
use EDAMUserStore::UserStore;
use EDAMNoteStore::NoteStore;
use EDAMUserStore::Constants;
use IO::File;

has _mime_tipe_obj	=> (is => 'ro', isa => 'MIME::Types', default => sub{MIME::Types->new}, lazy => 1);
has filename		=> (is => 'rw', isa => 'Str');
has filebin		=> (is => 'rw', default => sub {
		my $self = shift;
		do {
			my $iof = IO::File->new( $self->filename, '<' )
				or EDAMTest::Exception::FileIOError->throw( "file open failed: $self->filename" );
			$iof->binmode( ':bytes' );
			do { local $/; <$iof> };
		};
	}, lazy => 1);
has md5_bin		=> (is => 'rw');
has md5_hex		=> (is => 'rw');
has resource		=> (is => 'ro', default => sub{
	my $self = shift;
	my $resource = EDAMTypes::Resource->new();
	$resource->mime( $self->mime );
 	my $data = EDAMTypes::Data->new();
	$data->size( $self->file_length );
	$data->bodyHash( $self->md5_bin );
	$data->body( $self->filebin );
	$resource->data( $data );
	$resource->attributes( EDAMTypes::ResourceAttributes->new() );
	$resource->attributes->fileName( $self->filename );
	$resource
}, lazy => 1);

sub file_length {
	my $self = shift;

	length $self->{filebin}
}

before md5_bin => sub {
	my $self = shift;
	if(not defined $self->{md5_bin}) {
		$self->{md5_bin} = Digest::MD5::md5( $self->filebin )
	}
};

before md5_hex => sub {
	my $self = shift;
	if(not defined $self->{md5_hex}) {
		$self->{md5_hex} = Digest::MD5::md5_hex( $self->filebin )
	}
};

sub mime {
	my $self = shift;
	$self->_mime_tipe_obj->mimeTypeOf($self->filename)
}

around BUILDARGS => sub {
	my $orig     = shift;
	my $class    = shift;
	my $filename = shift;

	$class->$orig(filename => $filename);
};

after filename => sub {
	my $self     = shift;
	return $self->{filename} if not @_;

	my $filename = shift;
	my $data = EDAMTypes::Data->new();
	$data->size( $self->file_length );
	$data->bodyHash( $self->md5_bin );
	$data->body( $self->filebin );

	$self
};

42

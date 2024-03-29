#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
require 5.6.0;
use strict;
use warnings;
use Thrift;

package EDAMUserStore::SponsoredGroupRole;
use constant GROUP_MEMBER => 1;
use constant GROUP_ADMIN => 2;
use constant GROUP_OWNER => 3;
package EDAMUserStore::PublicUserInfo;
use base qw(Class::Accessor);
EDAMUserStore::PublicUserInfo->mk_accessors( qw( userId shardId privilege username noteStoreUrl ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{userId} = undef;
  $self->{shardId} = undef;
  $self->{privilege} = undef;
  $self->{username} = undef;
  $self->{noteStoreUrl} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{userId}) {
      $self->{userId} = $vals->{userId};
    }
    if (defined $vals->{shardId}) {
      $self->{shardId} = $vals->{shardId};
    }
    if (defined $vals->{privilege}) {
      $self->{privilege} = $vals->{privilege};
    }
    if (defined $vals->{username}) {
      $self->{username} = $vals->{username};
    }
    if (defined $vals->{noteStoreUrl}) {
      $self->{noteStoreUrl} = $vals->{noteStoreUrl};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'PublicUserInfo';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{userId});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{shardId});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{privilege});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{username});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{noteStoreUrl});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('PublicUserInfo');
  if (defined $self->{userId}) {
    $xfer += $output->writeFieldBegin('userId', TType::I32, 1);
    $xfer += $output->writeI32($self->{userId});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{shardId}) {
    $xfer += $output->writeFieldBegin('shardId', TType::STRING, 2);
    $xfer += $output->writeString($self->{shardId});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{privilege}) {
    $xfer += $output->writeFieldBegin('privilege', TType::I32, 3);
    $xfer += $output->writeI32($self->{privilege});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{username}) {
    $xfer += $output->writeFieldBegin('username', TType::STRING, 4);
    $xfer += $output->writeString($self->{username});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{noteStoreUrl}) {
    $xfer += $output->writeFieldBegin('noteStoreUrl', TType::STRING, 5);
    $xfer += $output->writeString($self->{noteStoreUrl});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package EDAMUserStore::PremiumInfo;
use base qw(Class::Accessor);
EDAMUserStore::PremiumInfo->mk_accessors( qw( currentTime premium premiumRecurring premiumExpirationDate premiumExtendable premiumPending premiumCancellationPending canPurchaseUploadAllowance sponsoredGroupName sponsoredGroupRole businessName businessAdmin ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{currentTime} = undef;
  $self->{premium} = undef;
  $self->{premiumRecurring} = undef;
  $self->{premiumExpirationDate} = undef;
  $self->{premiumExtendable} = undef;
  $self->{premiumPending} = undef;
  $self->{premiumCancellationPending} = undef;
  $self->{canPurchaseUploadAllowance} = undef;
  $self->{sponsoredGroupName} = undef;
  $self->{sponsoredGroupRole} = undef;
  $self->{businessName} = undef;
  $self->{businessAdmin} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{currentTime}) {
      $self->{currentTime} = $vals->{currentTime};
    }
    if (defined $vals->{premium}) {
      $self->{premium} = $vals->{premium};
    }
    if (defined $vals->{premiumRecurring}) {
      $self->{premiumRecurring} = $vals->{premiumRecurring};
    }
    if (defined $vals->{premiumExpirationDate}) {
      $self->{premiumExpirationDate} = $vals->{premiumExpirationDate};
    }
    if (defined $vals->{premiumExtendable}) {
      $self->{premiumExtendable} = $vals->{premiumExtendable};
    }
    if (defined $vals->{premiumPending}) {
      $self->{premiumPending} = $vals->{premiumPending};
    }
    if (defined $vals->{premiumCancellationPending}) {
      $self->{premiumCancellationPending} = $vals->{premiumCancellationPending};
    }
    if (defined $vals->{canPurchaseUploadAllowance}) {
      $self->{canPurchaseUploadAllowance} = $vals->{canPurchaseUploadAllowance};
    }
    if (defined $vals->{sponsoredGroupName}) {
      $self->{sponsoredGroupName} = $vals->{sponsoredGroupName};
    }
    if (defined $vals->{sponsoredGroupRole}) {
      $self->{sponsoredGroupRole} = $vals->{sponsoredGroupRole};
    }
    if (defined $vals->{businessName}) {
      $self->{businessName} = $vals->{businessName};
    }
    if (defined $vals->{businessAdmin}) {
      $self->{businessAdmin} = $vals->{businessAdmin};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'PremiumInfo';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::I64) {
        $xfer += $input->readI64(\$self->{currentTime});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{premium});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{premiumRecurring});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::I64) {
        $xfer += $input->readI64(\$self->{premiumExpirationDate});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{premiumExtendable});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{premiumPending});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^7$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{premiumCancellationPending});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^8$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{canPurchaseUploadAllowance});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^9$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{sponsoredGroupName});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^10$/ && do{      if ($ftype == TType::I32) {
        $xfer += $input->readI32(\$self->{sponsoredGroupRole});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^11$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{businessName});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^12$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{businessAdmin});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('PremiumInfo');
  if (defined $self->{currentTime}) {
    $xfer += $output->writeFieldBegin('currentTime', TType::I64, 1);
    $xfer += $output->writeI64($self->{currentTime});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{premium}) {
    $xfer += $output->writeFieldBegin('premium', TType::BOOL, 2);
    $xfer += $output->writeBool($self->{premium});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{premiumRecurring}) {
    $xfer += $output->writeFieldBegin('premiumRecurring', TType::BOOL, 3);
    $xfer += $output->writeBool($self->{premiumRecurring});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{premiumExpirationDate}) {
    $xfer += $output->writeFieldBegin('premiumExpirationDate', TType::I64, 4);
    $xfer += $output->writeI64($self->{premiumExpirationDate});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{premiumExtendable}) {
    $xfer += $output->writeFieldBegin('premiumExtendable', TType::BOOL, 5);
    $xfer += $output->writeBool($self->{premiumExtendable});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{premiumPending}) {
    $xfer += $output->writeFieldBegin('premiumPending', TType::BOOL, 6);
    $xfer += $output->writeBool($self->{premiumPending});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{premiumCancellationPending}) {
    $xfer += $output->writeFieldBegin('premiumCancellationPending', TType::BOOL, 7);
    $xfer += $output->writeBool($self->{premiumCancellationPending});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{canPurchaseUploadAllowance}) {
    $xfer += $output->writeFieldBegin('canPurchaseUploadAllowance', TType::BOOL, 8);
    $xfer += $output->writeBool($self->{canPurchaseUploadAllowance});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{sponsoredGroupName}) {
    $xfer += $output->writeFieldBegin('sponsoredGroupName', TType::STRING, 9);
    $xfer += $output->writeString($self->{sponsoredGroupName});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{sponsoredGroupRole}) {
    $xfer += $output->writeFieldBegin('sponsoredGroupRole', TType::I32, 10);
    $xfer += $output->writeI32($self->{sponsoredGroupRole});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{businessName}) {
    $xfer += $output->writeFieldBegin('businessName', TType::STRING, 11);
    $xfer += $output->writeString($self->{businessName});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{businessAdmin}) {
    $xfer += $output->writeFieldBegin('businessAdmin', TType::BOOL, 12);
    $xfer += $output->writeBool($self->{businessAdmin});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package EDAMUserStore::AuthenticationResult;
use base qw(Class::Accessor);
EDAMUserStore::AuthenticationResult->mk_accessors( qw( currentTime authenticationToken expiration user publicUserInfo noteStoreUrl webApiUrlPrefix ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{currentTime} = undef;
  $self->{authenticationToken} = undef;
  $self->{expiration} = undef;
  $self->{user} = undef;
  $self->{publicUserInfo} = undef;
  $self->{noteStoreUrl} = undef;
  $self->{webApiUrlPrefix} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{currentTime}) {
      $self->{currentTime} = $vals->{currentTime};
    }
    if (defined $vals->{authenticationToken}) {
      $self->{authenticationToken} = $vals->{authenticationToken};
    }
    if (defined $vals->{expiration}) {
      $self->{expiration} = $vals->{expiration};
    }
    if (defined $vals->{user}) {
      $self->{user} = $vals->{user};
    }
    if (defined $vals->{publicUserInfo}) {
      $self->{publicUserInfo} = $vals->{publicUserInfo};
    }
    if (defined $vals->{noteStoreUrl}) {
      $self->{noteStoreUrl} = $vals->{noteStoreUrl};
    }
    if (defined $vals->{webApiUrlPrefix}) {
      $self->{webApiUrlPrefix} = $vals->{webApiUrlPrefix};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'AuthenticationResult';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::I64) {
        $xfer += $input->readI64(\$self->{currentTime});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{authenticationToken});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::I64) {
        $xfer += $input->readI64(\$self->{expiration});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::STRUCT) {
        $self->{user} = new EDAMTypes::User();
        $xfer += $self->{user}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::STRUCT) {
        $self->{publicUserInfo} = new EDAMUserStore::PublicUserInfo();
        $xfer += $self->{publicUserInfo}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{noteStoreUrl});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^7$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{webApiUrlPrefix});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('AuthenticationResult');
  if (defined $self->{currentTime}) {
    $xfer += $output->writeFieldBegin('currentTime', TType::I64, 1);
    $xfer += $output->writeI64($self->{currentTime});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{authenticationToken}) {
    $xfer += $output->writeFieldBegin('authenticationToken', TType::STRING, 2);
    $xfer += $output->writeString($self->{authenticationToken});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{expiration}) {
    $xfer += $output->writeFieldBegin('expiration', TType::I64, 3);
    $xfer += $output->writeI64($self->{expiration});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{user}) {
    $xfer += $output->writeFieldBegin('user', TType::STRUCT, 4);
    $xfer += $self->{user}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{publicUserInfo}) {
    $xfer += $output->writeFieldBegin('publicUserInfo', TType::STRUCT, 5);
    $xfer += $self->{publicUserInfo}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{noteStoreUrl}) {
    $xfer += $output->writeFieldBegin('noteStoreUrl', TType::STRING, 6);
    $xfer += $output->writeString($self->{noteStoreUrl});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{webApiUrlPrefix}) {
    $xfer += $output->writeFieldBegin('webApiUrlPrefix', TType::STRING, 7);
    $xfer += $output->writeString($self->{webApiUrlPrefix});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package EDAMUserStore::BootstrapSettings;
use base qw(Class::Accessor);
EDAMUserStore::BootstrapSettings->mk_accessors( qw( serviceHost marketingUrl supportUrl accountEmailDomain enableFacebookSharing enableGiftSubscriptions enableSupportTickets enableSharedNotebooks enableSingleNoteSharing enableSponsoredAccounts enableTwitterSharing enableLinkedInSharing ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{serviceHost} = undef;
  $self->{marketingUrl} = undef;
  $self->{supportUrl} = undef;
  $self->{accountEmailDomain} = undef;
  $self->{enableFacebookSharing} = undef;
  $self->{enableGiftSubscriptions} = undef;
  $self->{enableSupportTickets} = undef;
  $self->{enableSharedNotebooks} = undef;
  $self->{enableSingleNoteSharing} = undef;
  $self->{enableSponsoredAccounts} = undef;
  $self->{enableTwitterSharing} = undef;
  $self->{enableLinkedInSharing} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{serviceHost}) {
      $self->{serviceHost} = $vals->{serviceHost};
    }
    if (defined $vals->{marketingUrl}) {
      $self->{marketingUrl} = $vals->{marketingUrl};
    }
    if (defined $vals->{supportUrl}) {
      $self->{supportUrl} = $vals->{supportUrl};
    }
    if (defined $vals->{accountEmailDomain}) {
      $self->{accountEmailDomain} = $vals->{accountEmailDomain};
    }
    if (defined $vals->{enableFacebookSharing}) {
      $self->{enableFacebookSharing} = $vals->{enableFacebookSharing};
    }
    if (defined $vals->{enableGiftSubscriptions}) {
      $self->{enableGiftSubscriptions} = $vals->{enableGiftSubscriptions};
    }
    if (defined $vals->{enableSupportTickets}) {
      $self->{enableSupportTickets} = $vals->{enableSupportTickets};
    }
    if (defined $vals->{enableSharedNotebooks}) {
      $self->{enableSharedNotebooks} = $vals->{enableSharedNotebooks};
    }
    if (defined $vals->{enableSingleNoteSharing}) {
      $self->{enableSingleNoteSharing} = $vals->{enableSingleNoteSharing};
    }
    if (defined $vals->{enableSponsoredAccounts}) {
      $self->{enableSponsoredAccounts} = $vals->{enableSponsoredAccounts};
    }
    if (defined $vals->{enableTwitterSharing}) {
      $self->{enableTwitterSharing} = $vals->{enableTwitterSharing};
    }
    if (defined $vals->{enableLinkedInSharing}) {
      $self->{enableLinkedInSharing} = $vals->{enableLinkedInSharing};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'BootstrapSettings';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{serviceHost});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{marketingUrl});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{supportUrl});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{accountEmailDomain});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableFacebookSharing});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^6$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableGiftSubscriptions});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^7$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableSupportTickets});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^8$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableSharedNotebooks});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^9$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableSingleNoteSharing});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^10$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableSponsoredAccounts});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^11$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableTwitterSharing});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^12$/ && do{      if ($ftype == TType::BOOL) {
        $xfer += $input->readBool(\$self->{enableLinkedInSharing});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('BootstrapSettings');
  if (defined $self->{serviceHost}) {
    $xfer += $output->writeFieldBegin('serviceHost', TType::STRING, 1);
    $xfer += $output->writeString($self->{serviceHost});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{marketingUrl}) {
    $xfer += $output->writeFieldBegin('marketingUrl', TType::STRING, 2);
    $xfer += $output->writeString($self->{marketingUrl});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{supportUrl}) {
    $xfer += $output->writeFieldBegin('supportUrl', TType::STRING, 3);
    $xfer += $output->writeString($self->{supportUrl});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{accountEmailDomain}) {
    $xfer += $output->writeFieldBegin('accountEmailDomain', TType::STRING, 4);
    $xfer += $output->writeString($self->{accountEmailDomain});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableFacebookSharing}) {
    $xfer += $output->writeFieldBegin('enableFacebookSharing', TType::BOOL, 5);
    $xfer += $output->writeBool($self->{enableFacebookSharing});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableGiftSubscriptions}) {
    $xfer += $output->writeFieldBegin('enableGiftSubscriptions', TType::BOOL, 6);
    $xfer += $output->writeBool($self->{enableGiftSubscriptions});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableSupportTickets}) {
    $xfer += $output->writeFieldBegin('enableSupportTickets', TType::BOOL, 7);
    $xfer += $output->writeBool($self->{enableSupportTickets});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableSharedNotebooks}) {
    $xfer += $output->writeFieldBegin('enableSharedNotebooks', TType::BOOL, 8);
    $xfer += $output->writeBool($self->{enableSharedNotebooks});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableSingleNoteSharing}) {
    $xfer += $output->writeFieldBegin('enableSingleNoteSharing', TType::BOOL, 9);
    $xfer += $output->writeBool($self->{enableSingleNoteSharing});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableSponsoredAccounts}) {
    $xfer += $output->writeFieldBegin('enableSponsoredAccounts', TType::BOOL, 10);
    $xfer += $output->writeBool($self->{enableSponsoredAccounts});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableTwitterSharing}) {
    $xfer += $output->writeFieldBegin('enableTwitterSharing', TType::BOOL, 11);
    $xfer += $output->writeBool($self->{enableTwitterSharing});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{enableLinkedInSharing}) {
    $xfer += $output->writeFieldBegin('enableLinkedInSharing', TType::BOOL, 12);
    $xfer += $output->writeBool($self->{enableLinkedInSharing});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package EDAMUserStore::BootstrapProfile;
use base qw(Class::Accessor);
EDAMUserStore::BootstrapProfile->mk_accessors( qw( name settings ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{name} = undef;
  $self->{settings} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{name}) {
      $self->{name} = $vals->{name};
    }
    if (defined $vals->{settings}) {
      $self->{settings} = $vals->{settings};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'BootstrapProfile';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::STRING) {
        $xfer += $input->readString(\$self->{name});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == TType::STRUCT) {
        $self->{settings} = new EDAMUserStore::BootstrapSettings();
        $xfer += $self->{settings}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('BootstrapProfile');
  if (defined $self->{name}) {
    $xfer += $output->writeFieldBegin('name', TType::STRING, 1);
    $xfer += $output->writeString($self->{name});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{settings}) {
    $xfer += $output->writeFieldBegin('settings', TType::STRUCT, 2);
    $xfer += $self->{settings}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package EDAMUserStore::BootstrapInfo;
use base qw(Class::Accessor);
EDAMUserStore::BootstrapInfo->mk_accessors( qw( profiles ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{profiles} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{profiles}) {
      $self->{profiles} = $vals->{profiles};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'BootstrapInfo';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == TType::LIST) {
        {
          my $_size0 = 0;
          $self->{profiles} = [];
          my $_etype3 = 0;
          $xfer += $input->readListBegin(\$_etype3, \$_size0);
          for (my $_i4 = 0; $_i4 < $_size0; ++$_i4)
          {
            my $elem5 = undef;
            $elem5 = new EDAMUserStore::BootstrapProfile();
            $xfer += $elem5->read($input);
            push(@{$self->{profiles}},$elem5);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('BootstrapInfo');
  if (defined $self->{profiles}) {
    $xfer += $output->writeFieldBegin('profiles', TType::LIST, 1);
    {
      $xfer += $output->writeListBegin(TType::STRUCT, scalar(@{$self->{profiles}}));
      {
        foreach my $iter6 (@{$self->{profiles}}) 
        {
          $xfer += ${iter6}->write($output);
        }
      }
      $xfer += $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

1;

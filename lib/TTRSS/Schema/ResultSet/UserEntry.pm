package TTRSS::Schema::ResultSet::UserEntry;

use strict;
use warnings;

use base 'DBIx::Class::ResultSet';

sub unread {
  my $self = shift;
  return $self->search({ $self->current_source_alias . '.unread' => 1 });
}

1;

use utf8;
package TTRSS::Schema::Result::UserEntry;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_user_entries");
__PACKAGE__->add_columns(
  "int_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "ref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "uuid",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "feed_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "orig_feed_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "marked",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "published",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "tag_cache",
  { data_type => "text", is_nullable => 0 },
  "label_cache",
  { data_type => "text", is_nullable => 0 },
  "last_read",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "UTC",
  },
  "score",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "note",
  { data_type => "longtext", is_nullable => 1 },
  "unread",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "last_marked",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "UTC",
  },
  "last_published",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "UTC",
  },
);
__PACKAGE__->set_primary_key("int_id");
__PACKAGE__->belongs_to(
  "feed",
  "TTRSS::Schema::Result::Feed",
  { id => "feed_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "RESTRICT",
  },
);
__PACKAGE__->belongs_to(
  "orig_feed",
  "TTRSS::Schema::Result::ArchivedFeeds",
  { id => "orig_feed_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "RESTRICT",
  },
);
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "ref",
  "TTRSS::Schema::Result::Entry",
  { id => "ref_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->has_many(
  "tags",
  "TTRSS::Schema::Result::Tag",
  { "foreign.post_int_id" => "self.int_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 01:30:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zzFOCSB+IZndKrGSefd2Kg

use DateTime;

sub mark_read {
  my ($self, $date) = @_;
  $self->last_read( $date // DateTime->now );
  $self->unread(0);
  $self->update;
  $self->discard_changes;
}

1;

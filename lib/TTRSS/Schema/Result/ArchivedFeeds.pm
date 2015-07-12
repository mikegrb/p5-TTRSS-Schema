use utf8;
package TTRSS::Schema::Result::ArchivedFeeds;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_archived_feeds");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "feed_url",
  { data_type => "text", is_nullable => 0 },
  "site_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->has_many(
  "ttrss_user_entries",
  "TTRSS::Schema::Result::UserEntry",
  { "foreign.orig_feed_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FWZV614/FNOqSIJXAjEXyQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

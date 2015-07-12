use utf8;
package TTRSS::Schema::Result::EntryComment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_entry_comments");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "ref_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "private",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "date_entered",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("id");
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


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uadO+s3+DfjHr3nfTtJrdw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

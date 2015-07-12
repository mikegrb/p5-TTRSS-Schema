use utf8;
package TTRSS::Schema::Result::ErrorLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_error_log");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "errno",
  { data_type => "integer", is_nullable => 0 },
  "errstr",
  { data_type => "text", is_nullable => 0 },
  "filename",
  { data_type => "text", is_nullable => 0 },
  "lineno",
  { data_type => "integer", is_nullable => 0 },
  "context",
  { data_type => "text", is_nullable => 0 },
  "created_at",
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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rWIYmsfIZwBtWuW7I/x3xg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

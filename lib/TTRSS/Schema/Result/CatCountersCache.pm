use utf8;
package TTRSS::Schema::Result::CatCountersCache;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_cat_counters_cache");
__PACKAGE__->add_columns(
  "feed_id",
  { data_type => "integer", is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
    timezone => "UTC",
  },
);
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:43:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dRqy8pBda5YjObu7w3gWOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

use utf8;
package TTRSS::Schema::Result::LinkedFeeds;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_linked_feeds");
__PACKAGE__->add_columns(
  "feed_url",
  { data_type => "text", is_nullable => 0 },
  "site_url",
  { data_type => "text", is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "created",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
    timezone => "UTC",
  },
  "updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
    timezone => "UTC",
  },
  "instance_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "subscribers",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->belongs_to(
  "instance",
  "TTRSS::Schema::Result::LinkedInstance",
  { id => "instance_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:43:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wm5zbMJNhYh7n5cU3apbrA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

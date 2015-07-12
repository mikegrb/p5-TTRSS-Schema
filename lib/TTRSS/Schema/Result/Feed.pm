use utf8;
package TTRSS::Schema::Result::Feed;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_feeds");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "cat_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "feed_url",
  { data_type => "text", is_nullable => 0 },
  "icon_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "update_interval",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "purge_interval",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "last_updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 1,
  },
  "last_error",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "site_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "auth_login",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "auth_pass",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "parent_feed",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "private",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "rtl_content",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "hidden",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "include_in_digest",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "cache_images",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "cache_content",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "auth_pass_encrypted",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "last_viewed",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "last_update_started",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "always_display_enclosures",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "update_method",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "order_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "mark_unread_on_update",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "update_on_checksum_change",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "strip_images",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "pubsub_state",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "favicon_last_checked",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "hide_images",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "view_settings",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "favicon_avg_color",
  { data_type => "varchar", is_nullable => 1, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "cat",
  "TTRSS::Schema::Result::FeedCategory",
  { id => "cat_id" },
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
  "parent_feed",
  "TTRSS::Schema::Result::Feed",
  { id => "parent_feed" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "RESTRICT",
  },
);
__PACKAGE__->has_many(
  "ttrss_feeds",
  "TTRSS::Schema::Result::Feed",
  { "foreign.parent_feed" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_filters",
  "TTRSS::Schema::Result::Filter",
  { "foreign.feed_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_filters2_rules",
  "TTRSS::Schema::Result::Filters2Rule",
  { "foreign.feed_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_user_entries",
  "TTRSS::Schema::Result::UserEntry",
  { "foreign.feed_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:glYmkcG7KjpggmMMyXhkYw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

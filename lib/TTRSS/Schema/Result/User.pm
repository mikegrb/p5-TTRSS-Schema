use utf8;
package TTRSS::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_users");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "login",
  { data_type => "varchar", is_nullable => 0, size => 120 },
  "pwd_hash",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "last_login",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "UTC",
  },
  "access_level",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "theme_id",
  { data_type => "integer", is_nullable => 1 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "full_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "email_digest",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "last_digest_sent",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "UTC",
  },
  "salt",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "created",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
    timezone => "UTC",
  },
  "twitter_oauth",
  { data_type => "longtext", is_nullable => 1 },
  "otp_enabled",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "resetpass_token",
  { data_type => "varchar", is_nullable => 1, size => 250 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("login", ["login"]);
__PACKAGE__->has_many(
  "ttrss_access_keys",
  "TTRSS::Schema::Result::AccessKey",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_archiveds_feeds",
  "TTRSS::Schema::Result::ArchivedFeeds",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_cat_counters_caches",
  "TTRSS::Schema::Result::CatCountersCache",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_counters_caches",
  "TTRSS::Schema::Result::CountersCache",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_entry_comments",
  "TTRSS::Schema::Result::EntryComment",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_error_logs",
  "TTRSS::Schema::Result::ErrorLog",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_feed_categories",
  "TTRSS::Schema::Result::FeedCategory",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_feeds",
  "TTRSS::Schema::Result::Feed",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_filters",
  "TTRSS::Schema::Result::Filter",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_filters2s",
  "TTRSS::Schema::Result::Filters2",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_labels2s",
  "TTRSS::Schema::Result::Labels2",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_plugin_storages",
  "TTRSS::Schema::Result::PluginStorage",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_settings_profiles",
  "TTRSS::Schema::Result::SettingsProfile",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_tags",
  "TTRSS::Schema::Result::Tag",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_user_entries",
  "TTRSS::Schema::Result::UserEntry",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_user_prefs",
  "TTRSS::Schema::Result::UserPref",
  { "foreign.owner_uid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:43:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vl/dJoS1m72c0CNYMjVW7Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

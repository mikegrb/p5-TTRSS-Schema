use utf8;
package TTRSS::Schema::Result::FeedCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_feed_categories");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "collapsed",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "order_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "parent_cat",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "view_settings",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "feed_categories",
  "TTRSS::Schema::Result::FeedCategory",
  { "foreign.parent_cat" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "feeds",
  "TTRSS::Schema::Result::Feed",
  { "foreign.cat_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "filters",
  "TTRSS::Schema::Result::Filter",
  { "foreign.cat_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "filters2_rules",
  "TTRSS::Schema::Result::Filters2Rule",
  { "foreign.cat_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "parent_cat",
  "TTRSS::Schema::Result::FeedCategory",
  { id => "parent_cat" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 01:30:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WOb+MvAsiMbS2THpSHgCqw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

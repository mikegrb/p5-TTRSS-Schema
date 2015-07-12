use utf8;
package TTRSS::Schema::Result::Filter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_filters");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "feed_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "filter_type",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "reg_exp",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "filter_param",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "inverse",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "enabled",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "cat_filter",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "cat_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "action_id",
  {
    data_type      => "integer",
    default_value  => 1,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "action_param",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "action",
  "TTRSS::Schema::Result::FilterAction",
  { id => "action_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "cat",
  "TTRSS::Schema::Result::FeedCategory",
  { id => "cat_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "RESTRICT",
  },
);
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
  "filter_type",
  "TTRSS::Schema::Result::FilterType",
  { id => "filter_type" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O5/i6XBpZab1QHWNBodgZA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

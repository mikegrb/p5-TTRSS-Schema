use utf8;
package TTRSS::Schema::Result::Filters2;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_filters2");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "match_any_rule",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "enabled",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "inverse",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "order_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "title",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "filters2_actions",
  "TTRSS::Schema::Result::Filters2Action",
  { "foreign.filter_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "filters2_rules",
  "TTRSS::Schema::Result::Filters2Rule",
  { "foreign.filter_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 01:30:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1gV7gD+81CC3vcxeCrsiOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

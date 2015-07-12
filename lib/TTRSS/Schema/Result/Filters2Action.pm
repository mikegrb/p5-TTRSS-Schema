use utf8;
package TTRSS::Schema::Result::Filters2Action;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_filters2_actions");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "filter_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
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
  "filter",
  "TTRSS::Schema::Result::Filters2",
  { id => "filter_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X7GdlNBA8EjFdR63euehbA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

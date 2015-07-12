use utf8;
package TTRSS::Schema::Result::FilterAction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_filter_actions");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 120 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 250 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("description", ["description"]);
__PACKAGE__->add_unique_constraint("name", ["name"]);
__PACKAGE__->has_many(
  "ttrss_filters",
  "TTRSS::Schema::Result::Filter",
  { "foreign.action_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_filters2_actions",
  "TTRSS::Schema::Result::Filters2Action",
  { "foreign.action_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uBHs1TjL0kAyySel4MRqaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

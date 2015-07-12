use utf8;
package TTRSS::Schema::Result::FilterType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_filter_types");
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
  "filters",
  "TTRSS::Schema::Result::Filter",
  { "foreign.filter_type" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "filters2_rules",
  "TTRSS::Schema::Result::Filters2Rule",
  { "foreign.filter_type" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 01:30:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:t1cA1OjcmQDwVNKe3WGjFg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

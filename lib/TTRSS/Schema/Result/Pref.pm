use utf8;
package TTRSS::Schema::Result::Pref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_prefs");
__PACKAGE__->add_columns(
  "pref_name",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "section_id",
  {
    data_type      => "integer",
    default_value  => 1,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "access_level",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "def_value",
  { data_type => "text", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("pref_name");
__PACKAGE__->belongs_to(
  "section",
  "TTRSS::Schema::Result::PrefsSection",
  { id => "section_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "type",
  "TTRSS::Schema::Result::PrefsType",
  { id => "type_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);
__PACKAGE__->has_many(
  "user_prefs",
  "TTRSS::Schema::Result::UserPref",
  { "foreign.pref_name" => "self.pref_name" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 01:30:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gn39dQVkoKvVYSjMpkL6gA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

use utf8;
package TTRSS::Schema::Result::UserPref;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_user_prefs");
__PACKAGE__->add_columns(
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pref_name",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 1, size => 250 },
  "value",
  { data_type => "longtext", is_nullable => 0 },
  "profile",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "pref_name",
  "TTRSS::Schema::Result::Pref",
  { pref_name => "pref_name" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "RESTRICT",
  },
);
__PACKAGE__->belongs_to(
  "profile",
  "TTRSS::Schema::Result::SettingsProfile",
  { id => "profile" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n3NSBQ9AjnZoSWoz2jCCLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

use utf8;
package TTRSS::Schema::Result::PrefsSection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_prefs_sections");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "order_id",
  { data_type => "integer", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "ttrss_prefs",
  "TTRSS::Schema::Result::Pref",
  { "foreign.section_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pyKxmyeSH2lUcRBGZzEasw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

use utf8;
package TTRSS::Schema::Result::Labels2;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_labels2");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "owner_uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "caption",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "fg_color",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 15 },
  "bg_color",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 15 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "owner_uid",
  "TTRSS::Schema::Result::User",
  { id => "owner_uid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->has_many(
  "ttrss_user_labels2s",
  "TTRSS::Schema::Result::UserLabels2",
  { "foreign.label_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rQZNbgQzb6BQFeXsRMkgpg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

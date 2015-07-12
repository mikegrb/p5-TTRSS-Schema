use utf8;
package TTRSS::Schema::Result::Enclosure;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_enclosures");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "content_url",
  { data_type => "text", is_nullable => 0 },
  "content_type",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "post_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "duration",
  { data_type => "text", is_nullable => 0 },
  "width",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "height",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "post",
  "TTRSS::Schema::Result::Entry",
  { id => "post_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l7Kc5vUGhvSsEv9ymXo43g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

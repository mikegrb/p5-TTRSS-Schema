use utf8;
package TTRSS::Schema::Result::Entry;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_entries");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "guid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "link",
  { data_type => "text", is_nullable => 0 },
  "updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "content",
  { data_type => "longtext", is_nullable => 0 },
  "content_hash",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "cached_content",
  { data_type => "longtext", is_nullable => 1 },
  "no_orig_date",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "date_entered",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "date_updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "num_comments",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "plugin_data",
  { data_type => "longtext", is_nullable => 1 },
  "comments",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "author",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 250 },
  "lang",
  { data_type => "varchar", is_nullable => 1, size => 2 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("guid", ["guid"]);
__PACKAGE__->has_many(
  "ttrss_enclosures",
  "TTRSS::Schema::Result::Enclosure",
  { "foreign.post_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_entry_comments",
  "TTRSS::Schema::Result::EntryComment",
  { "foreign.ref_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_user_entries",
  "TTRSS::Schema::Result::UserEntry",
  { "foreign.ref_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "ttrss_user_labels2s",
  "TTRSS::Schema::Result::UserLabels2",
  { "foreign.article_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T/F5Eueelr2Q6D05Fox90A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

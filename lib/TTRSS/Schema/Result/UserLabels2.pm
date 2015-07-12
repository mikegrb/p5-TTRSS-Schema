use utf8;
package TTRSS::Schema::Result::UserLabels2;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_user_labels2");
__PACKAGE__->add_columns(
  "label_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "article_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->belongs_to(
  "article",
  "TTRSS::Schema::Result::Entry",
  { id => "article_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "label",
  "TTRSS::Schema::Result::Labels2",
  { id => "label_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F9jf66KJxjxB0Bo2bWAo6A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

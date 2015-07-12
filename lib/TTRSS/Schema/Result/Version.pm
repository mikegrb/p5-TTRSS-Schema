use utf8;
package TTRSS::Schema::Result::Version;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_version");
__PACKAGE__->add_columns(
  "schema_version",
  { data_type => "integer", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MD/GBJQ9RlyUTvT/gpvRCQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

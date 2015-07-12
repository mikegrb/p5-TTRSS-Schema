use utf8;
package TTRSS::Schema::Result::FeedbrowserCache;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_feedbrowser_cache");
__PACKAGE__->add_columns(
  "feed_url",
  { data_type => "text", is_nullable => 0 },
  "site_url",
  { data_type => "text", is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "subscribers",
  { data_type => "integer", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OtiXkWaWVXcXz0SmuWIRdQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

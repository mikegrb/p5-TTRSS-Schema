use utf8;
package TTRSS::Schema::Result::LinkedInstance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("ttrss_linked_instances");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "last_connected",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "last_status_in",
  { data_type => "integer", is_nullable => 0 },
  "last_status_out",
  { data_type => "integer", is_nullable => 0 },
  "access_key",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "access_url",
  { data_type => "text", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("access_key", ["access_key"]);
__PACKAGE__->has_many(
  "ttrsses_linked_feeds",
  "TTRSS::Schema::Result::LinkedFeeds",
  { "foreign.instance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-07-12 00:14:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HQNjV4jYpJ1VqIU5Pd+7hA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

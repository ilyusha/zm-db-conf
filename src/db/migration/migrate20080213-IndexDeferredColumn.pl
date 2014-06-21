#!/usr/bin/perl
# 
# ***** BEGIN LICENSE BLOCK *****
# Zimbra Collaboration Suite Server
# Copyright (C) 2008, 2009, 2010, 2013 Zimbra, Inc.
# 
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software Foundation,
# version 2 of the License.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program.
# If not, see <http://www.gnu.org/licenses/>.
# ***** END LICENSE BLOCK *****
# 


use strict;
use Migrate;

Migrate::verifySchemaVersion(51);
addMailboxIndexDeferredCountColumn();
Migrate::updateSchemaVersion(51, 52);

exit(0);

#####################

sub addMailboxIndexDeferredCountColumn() {
  Migrate::log("Adding idx_deferred_count column to Mailbox table.");

  my $sql = <<ALTER_TABLE_EOF;
ALTER TABLE zimbra.mailbox ADD COLUMN idx_deferred_count INTEGER UNSIGNED NOT NULL DEFAULT 0;
ALTER_TABLE_EOF

  Migrate::runSql($sql);
}

#!/usr/bin/env ruby
#
# Copyright © 2016 Christopher Voltz
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require "bundler"
Bundler.require

VERSION = "0.01"

def print_version
  puts <<-EOS.gsub!(/^\s*/, "")
    #{File.basename($PROGRAM_NAME)} version #{VERSION}
    Copyright © 2016 Christopher Voltz
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
  EOS
end

if File.identical?(__FILE__, $PROGRAM_NAME)
  print_version
end

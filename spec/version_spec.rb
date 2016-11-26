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

RSpec.describe "print_version" do
  it "should display the license" do
    expect(STDOUT).to receive(:puts).with(/License GPL/)
    print_version
  end

  it "should display the copyright notice" do
    expect(STDOUT).to receive(:puts).with(/Copyright/)
    print_version
  end

  # When running rspec tests, $PROGRAM_NAME is rspec and not the name of the
  # script file being tested.
  it "should display the program name" do
    expect(STDOUT).to receive(:puts).with(/rspec/)
    print_version
  end

  it "should display the program version" do
    expect(STDOUT).to receive(:puts).with(/version #{VERSION}/)
    print_version
  end
end

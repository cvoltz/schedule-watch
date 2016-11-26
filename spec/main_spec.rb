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

RSpec.describe "main", :type => :aruba do
  context "when credentials are not provided" do
    before(:each) do
       ENV["WATCH_SCHEDULE_USERNAME"] = nil
       ENV["WATCH_SCHEDULE_PASSWORD"] = nil
       remove(CONFIG_FILENAME) if file?(CONFIG_FILENAME)
    end

    it "should show an error message" do
      run_simple "./watch-schedule.rb", fail_on_error: false
      expect(last_command_started.stdout).to match(/Error: Credentials must be specified/)
    end

    it "should exit with a non-zero status" do
      run_simple "./watch-schedule.rb", fail_on_error: false
      expect(last_command_started.exit_status).to eq(1)
    end
  end
end

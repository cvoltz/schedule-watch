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

RSpec.describe "credentials" do
  context "when WATCH_SCHEDULE_USERNAME and WATCH_SCHEDULE_PASSWORD are not set in environment" do
    before(:each) do
      ENV["WATCH_SCHEDULE_USERNAME"] = nil
      ENV["WATCH_SCHEDULE_PASSWORD"] = nil
    end

    context "when config file is not present" do
      before(:each) { delete_config }

      it "should return a nil username" do
        username, _ = credentials
        expect(username).to be_nil
      end

      it "should return a nil password" do
        _, password = credentials
        expect(password).to be_nil
      end
    end

    context "when config file is present" do
      it "should return username from :username in config file" do
        create_config(username: "fred")
        username, _ = credentials
        expect(username).to eq("fred")
      end

      it "should return password from :password in config file" do
        create_config(password: "secret")
        _, password = credentials
        expect(password).to eq("secret")
      end
    end
  end

  context "when WATCH_SCHEDULE_USERNAME and WATCH_SCHEDULE_PASSWORD are set in environment" do
    it "should return username from WATCH_SCHEDULE_USERNAME" do
      ENV["WATCH_SCHEDULE_USERNAME"] = "fred"
      username, _ = credentials
      expect(username).to eq("fred")
    end

    it "should return password from WATCH_SCHEDULE_PASSWORD" do
      ENV["WATCH_SCHEDULE_PASSWORD"] = "secret"
      _, password = credentials
      expect(password).to eq("secret")
    end
  end
end

def create_config(content)
  File.open(CONFIG_FILENAME, "w") { |file| file.puts content.to_yaml }
end

def delete_config
  File.delete(CONFIG_FILENAME) if File.exists?(CONFIG_FILENAME)
end

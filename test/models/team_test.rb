require 'test_helper'

class TeamTest < ActiveSupport::TestCase
   test "Should not save team without a team name" do
     team = Team.new
     assert_not team.save, "Saved the team without a team name"
  end
end

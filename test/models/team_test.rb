require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = teams(:mavericks)
  end

  test "teams created_at cannot be null" do
    assert(@team.created_at.present?)
  end

  test "teams updated_at cannot be null" do
    assert(@team.updated_at.present?)
  end

  test "should be valid" do
    assert @team.valid?
  end

  test "should initalize as pending" do
    assert @team.status == "pending"
  end

  test "team should have no players" do
    assert @team.players_id.count == 0
  end

  test "name should be present" do
    @team.team_name = ""
    assert_not @team.valid?
  end

  test "name should not be blank" do
    @team.team_name = "     "
    assert_not @team.valid?
  end

  test "team should be in a league" do
    assert (@team.league == "Gold" || @team.league == "Silver" || @team.league == "Bronze")
  end

  test "name should not be too long" do
    @team.team_name = "a" * 51
    assert_not @team.valid?
  end

  test "team should notice new user added" do
    @team.players_id = [1]
    assert @team.players_id[0] == 1
  end

  #test "team names should be unique" do
  # => TODO
  #end

  #test "captain_id must be the same as players_id" do
  # => TODO
  #end

  #test "players_id is limited to 20 players" do
  # => TODO
  #end

end

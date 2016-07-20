require 'test_helper'

class ScoreTest < ActiveSupport::TestCase

    def setup
      @score = scores(:one)
    end

    test "teams created_at cannot be null" do
      assert(@score.created_at.present?)
    end

    test "teams updated_at cannot be null" do
      assert(@score.updated_at.present?)
    end

    test "should be valid" do
      assert @score.valid?
    end

    test "should have a team 1 id" do
      assert !@score.team_1_id.nil?
    end

    test "should have a team 2 id" do
      assert !@score.team_2_id.nil?
    end

    # test "approved score should be false by default" do
    #   assert @score.approved_score == false
    # end

    test "should have a league" do
      assert (@score.league == "Vancouver" || @score.league == "Surrey" || @score.league == "Richmond")
    end

end

require 'test_helper'

class ScoreControllerTest < ActionController::TestCase
  include SessionsHelper

  setup do
    @user = users(:michael)
    @score = scores(:one)
    @team1 = teams(:one)
    @team2 = teams(:mavericks)

    @score.team_1_id = @team1.id
    @score.team_2_id = @team2.id
    @score.save
  end

  test "form can be accessed and properly redirects" do
    session[:user_id] = @user.id
    get :form, :format => @score
    assert_response :success
  end

  test "Vancouver league redirects to proper schedule after submission" do
    session[:user_id] = @user.id
    patch :submit, id: @score.id, score: {captain_1_team_1_score: 1, captain_1_team_2_score: 1}
    assert_redirected_to "/schedule"
    assert(flash[:success] == "Score submitted")
  end

  test "Surrey league redirects to proper schedule after submission" do
    session[:user_id] = @user.id
    @score.league = "Surrey"
    @score.save
    patch :submit, id: @score.id, score: {captain_1_team_1_score: 1, captain_1_team_2_score: 1}
    assert_redirected_to "/schedule2"
    assert(flash[:success] == "Score submitted")
  end

  test "Richmond league redirects to proper schedule after submission" do
    session[:user_id] = @user.id
    @score.league = "Richmond"
    @score.save
    patch :submit, id: @score.id, score: {captain_1_team_1_score: 1, captain_1_team_2_score: 1}
    assert_redirected_to "/schedule3"
    assert(flash[:success] == "Score submitted")
  end

  test "Incorrect league team redirects to proper schedule after submission" do
    session[:user_id] = @user.id
    @score.league = "WRONG"
    @score.save
    patch :submit, id: @score.id, score: {captain_1_team_1_score: 1, captain_1_team_2_score: 1}
    assert_redirected_to "/home"
    assert(flash[:warning] == "A Problem occured")
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
  end

  test "accepting the score from team 1 should update the official score values and redirect properly" do
    session[:user_id] = @user.id
    get :team_1_score_accept, id: @score.id
    assert(@score.official_team_1_score == @score.captain_1_team_1_score)
    assert(@score.official_team_2_score == @score.captain_1_team_2_score)
    assert_redirected_to "/scores"
  end

  test "accepting the score from team 2 should update the official score values and redirect properly" do
    session[:user_id] = @user.id
    get :team_1_score_accept, id: @score.id
    assert(@score.official_team_1_score == @score.captain_2_team_1_score)
    assert(@score.official_team_2_score == @score.captain_2_team_2_score)
    assert_redirected_to "/scores"
  end

end

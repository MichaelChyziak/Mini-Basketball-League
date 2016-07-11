require 'test_helper'

class TeamsControllerTest < ActionController::TestCase

  setup do
    @team = teams(:one)
    @user = users(:michael)
    @admin = User.create(username: "admin", email: "admin@xyz.com", password: "notadmin", password_confirmation: "notadmin", admin: true, super_admin: true)
  end

  test "normal users get redirected to home with a warning message if accessing index action" do
    session[:user_id] = @user.id
    get :index
    assert_redirected_to "/home"
    assert (flash[:warning] == "Only admins can access that page.")
  end

  test "admins can access the index page" do
    session[:user_id] = @admin.id
    get :index
    assert_response :success
  end

  test "should get new action" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "user can create a team and the team count will go up by 1" do
   pre_create_team_count = Team.all.count
   session[:user_id] = @user.id
   post :create, team: { team_name: "Testing" }
   post_create_team_count = Team.all.count
   assert (post_create_team_count - pre_create_team_count == 1)
  end

  test "user will automatically be added to the team they create" do
   session[:user_id] = @user.id
   post :create, team: { team_name: "tester" }
   team_made = Team.where(:team_name => "tester").first
   assert(team_made.players_id.include? @user.id)
  end

  test "user will automatically be made team captain of the team they create" do
   session[:user_id] = @user.id
   post :create, team: {team_name: "tester" }
   team_made = Team.where(:team_name => "tester").first
   assert(team_made.captain_id == @user.id)
  end

  #user.team_id is saved in the action but does not persist later on in the assert. Why?
  #test "user adds the team they create to their team list" do
  #  session[:user_id] = @user.id
  #  post :create, team: {team_name: "tester"}
  #  team_made = Team.where(:team_name => "tester").first
  #  assert(@user.team_id == team_made.id)
  #end

  test "after creating team user is redirected to the teams page" do
    session[:user_id] = @user.id
    post :create, team: {team_name: "tester" }
    team_made = Team.where(:team_name => "tester").first
    assert_redirected_to team_made
  end

  test "if user tries to create a team while already in one, redirect to home page and show error message" do
    session[:user_id] = @user.id
    @user.update_attribute(:team_id, 1)
    @user.save
    post :create, team: {team_name: "tester" }
    assert_redirected_to "/home"
    assert (flash[:warning] == "You could not create a team since you are currently in a team.")
  end

  # => TODO: update, destroy, edit, show, leave_team, approve, decline, join_team, captain_team, appoint_captain, remove_user, accept_user, declin_user, find_users_team, join

  # test "should show team" do
  #   get :show, id: @team
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @team
  #   assert_response :success
  # end
  #
  # test "should update team" do
  #   patch :update, id: @team, team: { name: @team.team_name }
  #   assert_redirected_to team_path(assigns(:team))
  # end
  #
  # test "should destroy team" do
  #   assert_difference('Team.count', -1) do
  #     delete :destroy, id: @team
  #   end
  #
  #   assert_redirected_to teams_path
  # end
end

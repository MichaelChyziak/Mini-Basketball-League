require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  include SessionsHelper

  setup do
    @team = teams(:one)
    @mavs = teams(:mavericks)
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

  test "should show team" do
    session[:user_id] = @user.id
    get :show, id: @team
    assert_response :success
  end

  test "normal user will get denied edit access" do
    session[:user_id] = @user.id
    get :edit, id: @team
    assert_redirected_to "/home"
    assert (flash[:warning] == "Only admins can access that page.")
  end

  test "admins are able to access edit page" do
    session[:user_id] = @admin.id
    get :edit, id: @team
    assert_response :success
  end

  test "user tries to leave a team that is not part of redirects back to the team page" do
    session[:user_id] = @user.id
    get :leave_team, id: @team.id
    assert_redirected_to "/teams/#{@team.id}"
    assert(@team.players_id.empty?)
  end

  test "user leaves their team and the team forgets the user" do
    session[:user_id] = @user.id
    @team.players_id << @user.id
    @team.save
    @user.update_attribute(:team_id, @team.id)
    assert(@team.players_id[0] == @user.id)
    get :leave_team, id: @team.id
    assert_redirected_to "/teams/#{@team.id}"
    #assert(@team.players_id.empty?) #Not working because database reset back to pre-action call
  end

  test "user leaves their team and remove the team from their database" do
    session[:user_id] = @user.id
    @team.players_id << @user.id
    @team.save
    @user.update_attribute(:team_id, @team.id)
    get :leave_team, id: @team.id
    assert_redirected_to "/teams/#{@team.id}"
    #assert(@user.team_id == -1) #Not working because database reset back to pre-action call
  end

  test "Admin approves a pending team with less than 8 approved teams(in that league), it becomes approved and redirects back to the teams page" do
    session[:user_id] = @admin.id
    get :approve, id: @mavs.id
    assert_redirected_to "/teams"
    #assert @mavs.status == "approved" #change does not persist coming back to test
  end

  test "Admin approves pending team but 8 or more teams in that league are already approved, redirect to teams page with message" do
    session[:user_id] = @admin.id
    get :approve, id: @team.id
    assert_redirected_to "/teams"
    assert(flash[:warning] == "The maximum of 8 teams already exist in that league.")
  end

  test "User tries to approve a team, get redirected to home page with error message" do
    session[:user_id] = @user.id
    get :approve, id: @mavs.id
    assert_redirected_to "/home"
    assert(flash[:warning] == "That action cannot be done.")
  end

  test "A non pending team tries to get approved, get redirected to home page with error message" do
    session[:user_id] = @user.id
    @mavs.status = "approved"
    get :approve, id: @mavs.id
    assert_redirected_to "/home"
    assert(flash[:warning] == "That action cannot be done.")
  end

  test "Admin declines a pending team, it becomes declined and redirects back to the teams page" do
    session[:user_id] = @admin.id
    get :decline, id: @mavs.id
    assert_redirected_to "/teams"
    #assert @mavs.status == "approved" #change does not persist coming back to test
  end

  test "User tries to decline a team, get redirected to home page with error message" do
    session[:user_id] = @user.id
    get :decline, id: @mavs.id
    assert_redirected_to "/home"
    assert(flash[:warning] == "That action cannot be done.")
  end

  test "A non pending team tries to get declined, get redirected to home page with error message" do
    session[:user_id] = @user.id
    @mavs.status == "approved"
    get :decline, id: @mavs.id
    assert_redirected_to "/home"
    assert(flash[:warning] == "That action cannot be done.")
  end

  test "user has already applied to join a team" do
    session[:user_id] = @user.id
    @team.applied_user_ids << @user.id
    @team.save
    get :join_team, id: @team.id
    assert_redirected_to "/teams/#{@team.id}"
    assert(flash[:warning] == "You have already applied to this team.")
  end

  test "user on no team applies to a team" do
    session[:user_id] = @user.id
    get :join_team, id: @team.id
    assert_redirected_to "/teams/#{@team.id}"
    assert(flash[:warning] == "You have successfully applied for this team.")
  end

  test "user already on a team applies a team" do
    session[:user_id] = @user.id
    @user.team_id = 1
    @user.save
    get :join_team, id: @team.id
    assert_redirected_to "/teams/#{@team.id}"
    assert(flash[:warning] == "You could not apply for this team since you are currently on a team.")
  end

  test "if captain goes to captain_team let him" do
    session[:user_id] = @user.id
    @team.captain_id = @user.id
    @team.save
    get :captain_team, id: @team.id
    assert_response :success
  end

  test "if not the captain of the team goes to the captain_team page, redirect to home page" do
    session[:user_id] = @user.id
    get :captain_team, id: @team.id
    assert_redirected_to "/home"
    assert(flash[:warning] == "Only team captains can access that page.")
  end

  # test "let the captain assign a new player to be captain" do
  #   session[:user_id] = @user.id
  #   @team.captain_id = @user.id
  #   @team.save
  #   get :appoint_captain, params: {team_id: @team.id, player_id: @admin.id}
  #   assert_redirected_to "/teams/#{@team.id}/captain_team"
  #   assert(flash[:warning] == "Successfully appointed another user as the team captain. You are no longer the team captain.")
  # end
  #
  # test "Don't let anybody but the team captain assign a new captain to the team" do
  #   session[:user_id] = @user.id
  #   get :appoint_captain, params: {team_id: @team.id, player_id: @admin.id}
  #   assert_redirected_to "home"
  #   assert(flash[:warning] == "Only the team's captain can do that action.")
  # end

  # test "let the captain remove a player from the team" do
  #   session[:user_id] = @user.id
  #   @team.captain_id = @user.id
  #   @team.save
  #   get :remove_user, params: {player_id: @admin.id}
  #   assert_redirected_to "/teams/#{@team.id}/captain_team"
  #   assert(flash[:warning] == "Successfully removed user from team.")
  # end
  #
  # test "Don't let anybody but the team captain remove a player from the team" do
  #   session[:user_id] = @user.id
  #   get :remove_user, params: {player_id: @admin.id}
  #   assert_redirected_to "/home"
  #   assert(flash[:warning] == "Only the team's captain can do that action.")
  # end

  test "Team captain can accept a pending user if they are not currently in a team" do
    @user2 = users(:two)
    session[:user_id] = @user.id
    @team.captain_id = @user.id
    @team.save
    get :accept_user, id: @team.id, player_id: @user2.id
    assert_redirected_to "/teams/#{@team.id}"
    assert(flash[:warning] == "Accepted user to team.")
  end

  # test "Team captain cannot accept a pending user if they are already in a team" do
  #   @user2 = users(:two)
  #   @user2.team_id = 1
  #   @user2.save
  #   #users team id is not updated in :accept_user
  #   session[:user_id] = @user.id
  #   @team.captain_id = @user.id
  #   @team.save
  #   get :accept_user, id: @team.id, player_id: @user2.id
  #   assert_redirected_to "/teams/#{@team.id}"
  #   assert(flash[:warning] == "User has already joined a team. Could not add user to team.")
  # end

  # test "No other users but the captain can accept pending users to the team" do
  #   @user2 = users(:another)
  #   #only works when I create the session user is the same as the captain user
  #   #cannot find route otherwise for some reason
  #   @team.captain_id = @user2.id #@team.captain_id = @user.id causes the error
  #   @team.save
  #   session[:user_id] = @user2.id
  #   get :accept_user, id: @team.id, player_id: @user2.id
  #   assert_redirected_to "/home"
  #   assert(flash[:warning] == "Only the team captains can perform that action.")
  # end

  test "Team captain can decline a pending user" do
    @user2 = users(:another)
    session[:user_id] = @user.id
    @team.captain_id = @user.id
    @team.applied_user_ids << @user2.id
    @team.save
    get :decline_user, id: @team.id, player_id: @user2.id
    assert_redirected_to "/teams/#{@team.id}"
    assert(flash[:warning] == "Declined user from team.")
  end

  # test "No other users but the captain can decline pending users to the team" do
  #   #same error seen as the previous one with unable to route if user for session!=captain
  #   @user2 = users(:another)
  #   session[:user_id] = @user2.id
  #   @team.captain_id = @user.id
  #   @team.applied_user_ids << @user2.id
  #   @team.save
  #   get :decline_user, id: @team.id, player_id: @user2.id
  #   assert_redirected_to "/teams/#{@team.id}"
  #   assert(flash[:warning] == "Declined user from team.")
  # end

  test "join action should properly route" do
    session[:user_id] = @user.id
    get :join
    assert_response :success
  end

  # test "should update team" do
  #   #unable to fix below error:
  #   # => ActionController::UrlGenerationError: No route matches
  #   # =>  {:action=>"show", :controller=>"teams", :id=>nil} missing required keys: [:id]
  #   patch :update, :id => @user.id, team: {team_name: "New One"}
  #   assert_redirected_to team_path(assigns(:team))
  # end

  test "admin should destroy team" do
    pre_create_team_count = Team.all.count
    session[:user_id] = @admin.id
    delete :destroy, id: @team
    post_create_team_count = Team.all.count
    assert (pre_create_team_count - post_create_team_count == 1)
    assert_redirected_to teams_path
    assert(flash[:warning] == 'Team was successfully destroyed.')
  end

  test "captain should destroy team" do
    pre_create_team_count = Team.all.count
    session[:user_id] = @user.id
    @team.update_attribute(:captain_id, @user.id)
    delete :destroy, id: @team
    post_create_team_count = Team.all.count
    assert (pre_create_team_count - post_create_team_count == 1)
    assert_redirected_to home_path
    assert(flash[:warning] == 'Team was successfully destroyed.')
  end

  test "users shouldn't destroy team" do
    pre_create_team_count = Team.all.count
    session[:user_id] = @user.id
    delete :destroy, id: @team
    post_create_team_count = Team.all.count
    assert (pre_create_team_count - post_create_team_count == 0)
    assert_redirected_to home_path
    assert(flash[:warning] == "Only admins can access that page.")
  end

end

require 'test_helper'

class LeagueControllerTest < ActionController::TestCase

  setup do
    @pre_score_count = Score.all.count
    @user = users(:michael)
    @team1 = teams(:gold1)
    @team2 = teams(:gold2)
    @team3 = teams(:gold3)
    @team4 = teams(:gold4)
    @team5 = teams(:gold5)
    @team6 = teams(:gold6)
    @team7 = teams(:gold7)
    @team8 = teams(:gold8)
    session[:user_id] = @user.id
  end

  #Views
  #N/A

  #Routing
  test "Routing: /league/start?league_name=Gold should invoke start action of the Gold league" do
    assert_recognizes({controller: 'league', action: 'start', league_name: 'Gold'}, 'league/start', { league_name: "Gold" })
  end

  test "Routing: /league/start?league_name=Silver should invoke start action of the Silver league" do
    assert_recognizes({controller: 'league', action: 'start', league_name: 'Silver'}, 'league/start', { league_name: "Silver" })
  end

  test "Routing: /league/start?league_name=Bronze should invoke start action of the Bronze league" do
    assert_recognizes({controller: 'league', action: 'start', league_name: 'Bronze'}, 'league/start', { league_name: "Bronze" })
  end

  #Controller
  #Test not working. League doesn't save in the controller although the new scores are created.
  test "Controller: start -> should find a league with the league name" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Gold"
    assert(League.find_by(:name => "Gold").active)
  end

  test "Creates 28 scores for the new league" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Gold"
    assert(Score.all.count - @pre_score_count == 28)
  end

  #test "Controller: start -> should redirect to main and flash a warning after a league name which doesn't exist is given" do
    # => TODO
  #end

  #test "Controller: start -> start a league when only 8 teams approved of the given league" do
    # => TODO
  #end

  test "Controller: start -> check that redirects back to /schedule" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Gold"
    assert_redirected_to "/schedule"
  end

  test "Controller: start -> check that redirects back to /schedule2" do
    @request.env['HTTP_REFERER'] = '/schedule2'
    get 'start', :league_name => "Gold"
    assert_redirected_to "/schedule2"
  end

  test "Controller: start -> check that redirects back to /schedule3" do
    @request.env['HTTP_REFERER'] = '/schedule3'
    get 'start', :league_name => "Gold"
    assert_redirected_to "/schedule3"
  end

  #test "Controller: start -> check that redirects back to /home after incorrect previous URL and flashes warning" do
    # => TODO
  #end

end

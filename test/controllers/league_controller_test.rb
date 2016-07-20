require 'test_helper'

class LeagueControllerTest < ActionController::TestCase

  setup do
    @pre_score_count = Score.all.count
    @user = users(:michael)
    @team1 = teams(:vancouver1)
    @team2 = teams(:vancouver2)
    @team3 = teams(:vancouver3)
    @team4 = teams(:vancouver4)
    @team5 = teams(:vancouver5)
    @team6 = teams(:vancouver6)
    @team7 = teams(:vancouver7)
    @team8 = teams(:vancouver8)
    session[:user_id] = @user.id
  end

  #Views
  #N/A

  #Routing
  test "Routing: /league/start?league_name=Vancouver should invoke start action of the Vancouver league" do
    assert_recognizes({controller: 'league', action: 'start', league_name: 'Vancouver'}, 'league/start', { league_name: "Vancouver" })
  end

  test "Routing: /league/start?league_name=Surrey should invoke start action of the Surrey league" do
    assert_recognizes({controller: 'league', action: 'start', league_name: 'Surrey'}, 'league/start', { league_name: "Surrey" })
  end

  test "Routing: /league/start?league_name=Richmond should invoke start action of the Richmond league" do
    assert_recognizes({controller: 'league', action: 'start', league_name: 'Richmond'}, 'league/start', { league_name: "Richmond" })
  end

  #Controller
  #Test not working. League doesn't save in the controller although the new scores are created.
  test "Controller: start -> should find a league with the league name" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Vancouver"
    assert(League.find_by(:name => "Vancouver").active)
  end

  test "Creates 28 scores for the new league" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Vancouver"
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
    get 'start', :league_name => "Vancouver"
    assert_redirected_to "/schedule"
  end

  test "Controller: start -> check that redirects back to /schedule2" do
    @request.env['HTTP_REFERER'] = '/schedule2'
    get 'start', :league_name => "Vancouver"
    assert_redirected_to "/schedule2"
  end

  test "Controller: start -> check that redirects back to /schedule3" do
    @request.env['HTTP_REFERER'] = '/schedule3'
    get 'start', :league_name => "Vancouver"
    assert_redirected_to "/schedule3"
  end

  #test "Controller: start -> check that redirects back to /home after incorrect previous URL and flashes warning" do
    # => TODO
  #end

end

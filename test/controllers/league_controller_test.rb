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

    League.create(name: "Vancouver")
    League.create(name: "Surrey")
    League.create(name: "Richmond")

    Map.create(name: "David Lam Park", info: "David Lam Park", lat: 49.272342, lng: -123.124583, league: 0)
    Map.create(name: "Sutcliffe Park", info: "Sutcliffe Park", lat: 49.268989, lng: -123.134834, league: 0)
    Map.create(name: "Garden Park", info: "Garden Park", lat: 49.268189, lng: -123.058892, league: 0)
    Map.create(name: "Oak Park", info: "Oak Park", lat: 49.215607, lng: -123.129056, league: 0)
    Map.create(name: "Queen Elizabeth Park", info: "Queen Elizabeth Park", lat: 49.241436, lng: -123.113533, league: 0)

    Map.create(name: "Garden City Park", info: "Garden City Park", lat: 49.165445, lng: -123.122790, league: 1)
    Map.create(name: "Hugh Boyd Community Park", info: "Hugh Boyd Community Park", lat: 49.146022, lng: -123.177731, league: 1)
    Map.create(name: "King George Community Park", info: "King George Community Park", lat: 49.183425, lng: -123.087645, league: 1)
    Map.create(name: "South Arm Courts", info: "South Arm Courts", lat: 49.140251, lng: -123.127766, league: 1)
    Map.create(name: "Thompson Courts", info: "Thompson Courts", lat: 49.163260, lng: -123.165560, league: 1)

    Map.create(name: "Bear Creek Park", info: "Bear Creek Park", lat: 49.160802, lng: -122.840934, league: 2)
    Map.create(name: "Bob Rutledge Court", info: "Bob Rutledge Court", lat: 49.100803, lng: -122.810683, league: 2)
    Map.create(name: "Fleetwood Park", info: "Fleetwood Park", lat: 49.146280, lng: -122.789638, league: 2)
    Map.create(name: "Goldstone Park", info: "Goldstone Park", lat: 49.109196, lng: -122.817557, league: 2)
    Map.create(name: "Tom Binnie Park", info: "Tom Binnie Park", lat: 49.196142, lng: -122.849728, league: 2)
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
  test "Controller: start -> should find a league with the league name" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Vancouver"
    assert(League.find_by(:name => "Vancouver"))
  end

  test "Creates 28 scores for the new league" do
    @request.env['HTTP_REFERER'] = '/schedule'
    get 'start', :league_name => "Vancouver"
    assert(Score.all.count - @pre_score_count == 28)
  end

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

end

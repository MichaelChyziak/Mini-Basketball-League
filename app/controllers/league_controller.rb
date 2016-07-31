class LeagueController < ApplicationController

  def start
    @league = League.where(:name => params[:league_name]).first
    @league.active = true
    @league.save

    # Create new scores (7 weeks with 4 games -> 7*4=28)
    teams = Team.where(:status =>1, :league =>params[:league_name])

    primary_court, secondary_court = calculate_courts(teams[0].players_id, teams[1].players_id)
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[1].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[2].players_id, teams[7].players_id)
    temp_score = Score.new(team_1_id: teams[2].id, team_2_id: teams[7].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[3].players_id, teams[6].players_id)
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[6].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[4].players_id, teams[5].players_id)
    temp_score = Score.new(team_1_id: teams[4].id, team_2_id: teams[5].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[2].players_id, teams[3].players_id)
    temp_score = Score.new(team_1_id: teams[2].id, team_2_id: teams[3].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[0].players_id, teams[6].players_id)
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[6].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[5].players_id, teams[7].players_id)
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[7].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[1].players_id, teams[4].players_id)
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[4].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[1].players_id, teams[5].players_id)
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[5].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[6].players_id, teams[7].players_id)
    temp_score = Score.new(team_1_id: teams[6].id, team_2_id: teams[7].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[3].players_id, teams[0].players_id)
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[0].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[4].players_id, teams[2].players_id)
    temp_score = Score.new(team_1_id: teams[4].id, team_2_id: teams[2].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[6].players_id, teams[4].players_id)
    temp_score = Score.new(team_1_id: teams[6].id, team_2_id: teams[4].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[7].players_id, teams[3].players_id)
    temp_score = Score.new(team_1_id: teams[7].id, team_2_id: teams[3].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[1].players_id, teams[2].players_id)
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[2].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[5].players_id, teams[0].players_id)
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[0].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[0].players_id, teams[2].players_id)
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[2].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[3].players_id, teams[1].players_id)
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[1].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[4].players_id, teams[7].players_id)
    temp_score = Score.new(team_1_id: teams[4].id, team_2_id: teams[7].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[5].players_id, teams[6].players_id)
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[6].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[3].players_id, teams[4].players_id)
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[4].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[7].players_id, teams[0].players_id)
    temp_score = Score.new(team_1_id: teams[7].id, team_2_id: teams[0].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[1].players_id, teams[6].players_id)
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[6].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[2].players_id, teams[5].players_id)
    temp_score = Score.new(team_1_id: teams[2].id, team_2_id: teams[5].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[6].players_id, teams[2].players_id)
    temp_score = Score.new(team_1_id: teams[6].id, team_2_id: teams[2].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[7].players_id, teams[1].players_id)
    temp_score = Score.new(team_1_id: teams[7].id, team_2_id: teams[1].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[0].players_id, teams[4].players_id)
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[4].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    primary_court, secondary_court = calculate_courts(teams[5].players_id, teams[3].players_id)
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[3].id, league: params[:league_name], primary_court: primary_court, secondary_court: secondary_court)
    temp_score.save
    @league.score_ids << temp_score.id

    @league.save

    if URI(request.referer).path == "/schedule"
      redirect_to "/schedule"
    elsif URI(request.referer).path == "/schedule2"
      redirect_to "/schedule2"
    elsif URI(request.referer).path == "/schedule3"
      redirect_to "/schedule3"
    else
      flash[:warning] = "Cannot perform that action."
      redirect_to "/home"
    end
  end

  def back
    @league = League.where(:name => params[:league_name]).first

    team = Team.where(:status =>1, :league =>params[:league_name])
    team.each do |t|
      t.update_attributes(:status => 0)
    end

    removeScores = Score.where(league: params[:league_name])
    removeScores.delete_all
    @league.score_ids = []
    @league.active = false
    @league.save

    if URI(request.referer).path == "/schedule"
      redirect_to "/schedule"
    elsif URI(request.referer).path == "/schedule2"
      redirect_to "/schedule2"
    elsif URI(request.referer).path == "/schedule3"
      redirect_to "/schedule3"
    else
      flash[:warning] = "Cannot perform that action."
      redirect_to "/home"
    end
  end

  private

  def calculate_courts(team1_ids, team2_ids)
    maps = Map.all
    vancouver_courts = {}
    surrey_courts = {}
    richmond_courts = {}
    maps.each do |map|
      if(map.vancouver?)
        vancouver_courts[map.name] = 0
      elsif(map.surrey?)
        surrey_courts[map.name] = 0
      else
        richmond_courts[map.name] = 0
      end
    end

    courts = {}
    if params[:league_name] == "Vancouver"
      courts = vancouver_courts
    elsif params[:league_name] == "Surrey"
      courts = surrey_courts
    elsif params[:league_name] == "Richmond"
      courts = richmond_courts
    end

    team1_ids.each do |id|
      primary = User.find(id).primary_court
      secondary = User.find(id).secondary_court
      if primary
        courts[primary] += 2
      end
      if secondary
        courts[secondary] += 1
      end
    end

    team2_ids.each do |id|
      primary = User.find(id).primary_court
      secondary = User.find(id).secondary_court
      if primary
        courts[primary] += 2
      end
      if secondary
        courts[secondary] += 1
      end
    end

    chosen_primary = courts.max_by{|key1,val1| val1}
    chosen_secondary = courts.except(chosen_primary[0]).max_by{|key2,val2| val2}

    return chosen_primary[0], chosen_secondary[0]

  end

end

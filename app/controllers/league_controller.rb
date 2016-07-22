class LeagueController < ApplicationController

  def start
    @league = League.where(:name => params[:league_name]).first
    @league.active = true
    @league.save

    # Create new scores (7 weeks with 4 games -> 7*4=28)
    teams = Team.where(:status =>1, :league =>params[:league_name])
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[1].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[2].id, team_2_id: teams[7].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[6].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[4].id, team_2_id: teams[5].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[2].id, team_2_id: teams[3].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[6].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[7].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[4].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[5].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[6].id, team_2_id: teams[7].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[0].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[4].id, team_2_id: teams[2].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[6].id, team_2_id: teams[4].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[7].id, team_2_id: teams[3].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[2].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[0].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[2].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[1].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[4].id, team_2_id: teams[7].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[6].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[3].id, team_2_id: teams[4].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[7].id, team_2_id: teams[0].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[1].id, team_2_id: teams[6].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[2].id, team_2_id: teams[5].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[6].id, team_2_id: teams[2].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[7].id, team_2_id: teams[1].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[0].id, team_2_id: teams[4].id, league: params[:league_name])
    temp_score.save
    @league.score_ids << temp_score.id
    temp_score = Score.new(team_1_id: teams[5].id, team_2_id: teams[3].id, league: params[:league_name])
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
    #Score.delete_all
    #Score.reset_pk_sequence
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
end

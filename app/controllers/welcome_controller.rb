class WelcomeController < ApplicationController

  # GET /welcome
  def index

  end
  def home

  end

  def profile

  end

  def about

  end
  
  def location
    @courtloc = params[:court]
    @curleague = params[:league]
    @curmap = Map.where(:league => @curleague)
  end

  def schedule
    @teams = Team.all
    @teams_approved = Team.where(:status =>1, :league =>"Vancouver")
    @league = League.where(name: "Vancouver").first
    @scores = Score.where(league: "Vancouver").order('id ASC')
  end

  def schedule2
    @teams = Team.all
    @teams_approved = Team.where(:status =>1, :league =>"Surrey")
    @league = League.where(name: "Surrey").first
    @scores = Score.where(league: "Surrey").order('id ASC')
  end

  def schedule3
    @teams = Team.all
    @teams_approved = Team.where(:status =>1, :league =>"Richmond")
    @league = League.where(name: "Richmond").first
    @scores = Score.where(league: "Richmond").order('id ASC')
  end

  def standings
     @teams_vancouver = Team.where(:status =>1, :league =>"Vancouver")
     @teams_surrey = Team.where(:status =>1, :league =>"Surrey")
     @teams_richmond = Team.where(:status =>1, :league =>"Richmond")
     @league_vancouver = League.where(name: "Vancouver").first
     @league_surrey = League.where(name: "Surrey").first
     @league_richmond = League.where(name: "Richmond").first

     @vancouver_sort = [] #sorted with [team id, points, games played, games won, games lost, games tied]
     if @league_vancouver.active?
       @teams_vancouver.each do |team|
         games_won = 0
         games_lost = 0
         games_played = 0
         games_tied = 0
         points = 0
         @league_vancouver.score_ids.each do |score_id|
           score = Score.find(score_id)
           if score.approved_score?
             if score.team_1_id == team.id
               if score.official_team_1_score > score.official_team_2_score
                 games_played = games_played + 1
                 games_won = games_won + 1
               elsif score.official_team_2_score > score.official_team_1_score
                 games_played = games_played + 1
                 games_lost = games_lost + 1
               else
                 games_played = games_played + 1
                 games_tied = games_tied + 1
               end
             elsif score.team_2_id == team.id
               if score.official_team_2_score > score.official_team_1_score
                 games_played = games_played + 1
                 games_won = games_won + 1
               elsif score.official_team_1_score > score.official_team_2_score
                 games_played = games_played + 1
                 games_lost = games_lost + 1
               else
                 games_played = games_played + 1
                 games_tied = games_tied + 1
               end
             end
           end
           points =  (games_won*2) + (games_tied*1)
         end
         @vancouver_sort << [team.id, points, games_played, games_won, games_lost, games_tied]
       end
       @vancouver_sort.sort_by!{|x,y|y}
       @vancouver_sort = @vancouver_sort.reverse
     end

     @surrey_sort = []
     if @league_surrey.active?
       @teams_surrey.each do |team|
         games_won = 0
         games_lost = 0
         games_played = 0
         games_tied = 0
         points = 0
         @league_surrey.score_ids.each do |score_id|
           score = Score.find(score_id)
           if score.approved_score?
             if score.team_1_id == team.id
               if score.official_team_1_score > score.official_team_2_score
                 games_played = games_played + 1
                 games_won = games_won + 1
               elsif score.official_team_2_score > score.official_team_1_score
                 games_played = games_played + 1
                 games_lost = games_lost + 1
               else
                 games_played = games_played + 1
                 games_tied = games_tied + 1
               end
             elsif score.team_2_id == team.id
               if score.official_team_2_score > score.official_team_1_score
                 games_played = games_played + 1
                 games_won = games_won + 1
               elsif score.official_team_1_score > score.official_team_2_score
                 games_played = games_played + 1
                 games_lost = games_lost + 1
               else
                 games_played = games_played + 1
                 games_tied = games_tied + 1
               end
             end
           end
           points =  (games_won*2) + (games_tied*1)
         end
         @surrey_sort << [team.id, points, games_played, games_won, games_lost, games_tied]
       end
       @surrey_sort.sort_by!{|x,y|y}
       @surrey_sort = @surrey_sort.reverse
     end

     @richmond_sort = []
     if @league_richmond.active?
       @teams_richmond.each do |team|
         games_won = 0
         games_lost = 0
         games_played = 0
         games_tied = 0
         points = 0
         @league_richmond.score_ids.each do |score_id|
           score = Score.find(score_id)
           if score.approved_score?
             if score.team_1_id == team.id
               if score.official_team_1_score > score.official_team_2_score
                 games_played = games_played + 1
                 games_won = games_won + 1
               elsif score.official_team_2_score > score.official_team_1_score
                 games_played = games_played + 1
                 games_lost = games_lost + 1
               else
                 games_played = games_played + 1
                 games_tied = games_tied + 1
               end
             elsif score.team_2_id == team.id
               if score.official_team_2_score > score.official_team_1_score
                 games_played = games_played + 1
                 games_won = games_won + 1
               elsif score.official_team_1_score > score.official_team_2_score
                 games_played = games_played + 1
                 games_lost = games_lost + 1
               else
                 games_played = games_played + 1
                 games_tied = games_tied + 1
               end
             end
           end
           points =  (games_won*2) + (games_tied*1)
         end
         @richmond_sort << [team.id, points, games_played, games_won, games_lost, games_tied]
       end
       @richmond_sort.sort_by!{|x,y|y}
       @richmond_sort = @richmond_sort.reverse
     end

  end

end

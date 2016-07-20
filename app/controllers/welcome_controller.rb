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
  end

end

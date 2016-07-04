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
    @teams_approved_gold = Team.where(:status =>1, :league =>"Gold")
    @league_gold = League.where(name: "Gold").first
  end

  def schedule2
    @teams = Team.all
    @teams_approved_silver = Team.where(:status =>1, :league =>"Silver")
    @league_silver = League.where(name: "Silver").first
  end

  def schedule3
    @teams = Team.all
    @teams_approved_bronze = Team.where(:status =>1, :league =>"Bronze")
    @league_bronze = League.where(name: "Bronze").first
  end

  def standings
     @teams_gold = Team.where(:status =>1, :league =>"Gold")
     @teams_silver = Team.where(:status =>1, :league =>"Silver")
     @teams_bronze = Team.where(:status =>1, :league =>"Bronze")
     @league_gold = League.where(name: "Gold").first
     @league_silver = League.where(name: "Silver").first
     @league_bronze = League.where(name: "Bronze").first
  end

end

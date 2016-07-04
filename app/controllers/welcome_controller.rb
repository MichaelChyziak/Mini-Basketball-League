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
    @teams_approved_silver = Team.where(:status =>1, :league =>"Silver")
    @teams_approved_bronze = Team.where(:status =>1, :league =>"Bronze")
  end

  def standings
     @teams = Team.all

  end

end

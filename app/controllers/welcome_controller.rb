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
     @teams_approved = Team.where(:status =>1) 
  end

end

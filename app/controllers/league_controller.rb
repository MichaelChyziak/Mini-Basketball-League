class LeagueController < ApplicationController

  def start
    @league = League.where(:name => params[:league_name]).first
    @league.active = true
    @league.save
    redirect_to "/schedule"
  end

end

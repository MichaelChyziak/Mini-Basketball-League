class ScoreController < ApplicationController
  before_action :set_score, only: [:submit]

  def form
    @score = Score.find(params[:format])
  end

  def submit
    @score = Score.find_by_id(params[:id])
    if @score.update_attributes(score_params)
      if @score.league == "Vancouver"
        redirect_to '/schedule'
        flash[:success] = "Score submitted"
      elsif @score.league == "Surrey"
        redirect_to '/schedule2'
        flash[:success] = "Score submitted"
      elsif @score.league == "Richmond"
        redirect_to '/schedule3'
        flash[:success] = "Score submitted"
      else
        redirect_to "/home"
        flash[:warning] = "A Problem occured"
      end
    else
      if @score.league == "Vancouver"
        redirect_to '/schedule'
        flash[:warning] = "Score submittion failed"
      elsif @score.league == "Surrey"
        redirect_to '/schedule2'
        flash[:warning] = "Score submittion failed"
      elsif @score.league == "Richmond"
        redirect_to '/schedule3'
        flash[:warning] = "Score submittion failed"
      else
        redirect_to "/home"
        flash[:warning] = "A Problem occured"
      end
    end
  end

  def index
    @scores = Score.all
  end

  def confirm
    @score = Score.find_by_id(params[:id])
    @score.update_attributes(score_params)
    @score.update_attribute(:approved_score, true)
    @score.save
    redirect_to '/scores'
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:team_1_id, :team_2_id, :captain_1_team_1_score,
                                 :captain_1_team_2_score, :captain_2_team_1_score,
                                 :captain_2_team_2_score, :official_team_1_score,
                                 :official_team_2_score, :approved_score,
                                 :league)
  end

end

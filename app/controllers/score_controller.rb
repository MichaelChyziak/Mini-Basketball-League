class ScoreController < ApplicationController
  before_action :set_score, only: [:submit]

  def form
    @score = Score.find(params[:format])
  end

  def submit
    @score = Score.find_by_id(params[:id])
    if @score.update_attributes(score_params)
      flash[:success] = "Score submitted"
      redirect_to '/schedule'
    else
      flash[:warning] = "Score submition failed"
      redirect_to '/schedule'
    end
  end

  def index
    @scores = Score.all
  end

  def team_1_score_accept
    score = Score.find(params[:id])
    score.update_attribute(:official_team_1_score, score.captain_1_team_1_score)
    score.update_attribute(:official_team_2_score, score.captain_1_team_2_score)
    score.update_attribute(:approved_score, true)
    score.save
    redirect_to '/scores'
  end

  def team_2_score_accept
    score = Score.find(params[:id])
    score.update_attribute(:official_team_1_score, score.captain_2_team_1_score)
    score.update_attribute(:official_team_2_score, score.captain_2_team_2_score)
    score.update_attribute(:approved_score, true)
    score.save
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

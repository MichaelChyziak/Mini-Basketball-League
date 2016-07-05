class ScoreController < ApplicationController
  before_action :set_score, only: [:submit]

  def form
    @score = Score.find(params[:format])
  end

  def submit
    @score = Score.find_by_id(params[:id])
    puts @score.id
    if @score.update_attributes(score_params)
      flash[:success] = "Score submitted"
      redirect_to '/schedule'
    else
      flash[:warning] = "Score submition failed"
      redirect_to '/schedule'
    end
  end

  private

  def set_score
    @score = Score.find(params[:id])
    puts @score.id
  end

  def score_params
    params.require(:score).permit(:team_1_id, :team_2_id, :captain_1_team_1_score,
                                 :captain_1_team_2_score, :captain_2_team_1_score,
                                 :captain_2_team_2_score, :official_team_1_score,
                                 :official_team_2_score, :approved_score,
                                 :league)
  end

end

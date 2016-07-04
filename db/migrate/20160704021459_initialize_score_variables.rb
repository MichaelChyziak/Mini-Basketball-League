class InitializeScoreVariables < ActiveRecord::Migration
  def change
    add_column :scores, :team_1_id, :integer
    add_column :scores, :team_2_id, :integer
    add_column :scores, :captain_1_team_1_score, :integer
    add_column :scores, :captain_1_team_2_score, :integer
    add_column :scores, :captain_2_team_1_score, :integer
    add_column :scores, :captain_2_team_2_score, :integer
    add_column :scores, :official_team_1_score, :integer
    add_column :scores, :official_team_2_score, :integer
    add_column :scores, :approved_score, :boolean, defualt: false
  end
end

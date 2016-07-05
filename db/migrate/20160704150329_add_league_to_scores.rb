class AddLeagueToScores < ActiveRecord::Migration
  def change
    add_column :scores, :league, :string
  end
end

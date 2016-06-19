class ChangeTeamNameDbLimitToTeams < ActiveRecord::Migration
  def change
    change_column :teams, :team_name, :string
  end
end

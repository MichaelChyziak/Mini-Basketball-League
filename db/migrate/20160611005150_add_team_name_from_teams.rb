class AddTeamNameFromTeams < ActiveRecord::Migration
  def change
    add_column :teams, :team_name, :string, :limit => 30
  end
end

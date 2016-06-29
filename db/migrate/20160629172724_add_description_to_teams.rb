class AddDescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :team_message, :text
  end
end

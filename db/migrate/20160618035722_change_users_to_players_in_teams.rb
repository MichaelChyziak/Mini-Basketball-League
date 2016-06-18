class ChangeUsersToPlayersInTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :users
    add_column :teams, :players_id, :integer, array: true, default:[]
  end
end

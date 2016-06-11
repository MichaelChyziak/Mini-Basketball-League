class AddUsersToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :users, :string, array: true, default:[]
  end
end

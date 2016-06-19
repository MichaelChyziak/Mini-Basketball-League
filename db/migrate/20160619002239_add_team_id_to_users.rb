class AddTeamIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team_id, :integer, :default => -1
  end
end

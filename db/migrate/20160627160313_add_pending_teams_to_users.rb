class AddPendingTeamsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pending_team_ids, :integer, array: true, default:[]
    add_column :teams, :applied_user_ids, :integer, array: true, default:[]
  end
end

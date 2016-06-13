class AddStatusToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :status, :integer, default: 0, null: false
  end
end

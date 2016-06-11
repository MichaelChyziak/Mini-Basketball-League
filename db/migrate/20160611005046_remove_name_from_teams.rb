class RemoveNameFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :name, :text
  end
end

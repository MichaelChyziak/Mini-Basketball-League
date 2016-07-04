class InitializeLeagueVariables < ActiveRecord::Migration
  def change
    add_column :leagues, :score_ids, :integer, array: true, default:[]
    add_column :leagues, :name, :string
    add_column :leagues, :active, :boolean, default: false
  end
end

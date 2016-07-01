class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :string
    add_column :users, :height, :float
    add_column :users, :weight, :float
    add_column :users, :twitter, :string
  end
end

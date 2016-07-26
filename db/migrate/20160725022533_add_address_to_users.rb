class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :primary_court, :string
    add_column :users, :secondary_court, :string
  end
end

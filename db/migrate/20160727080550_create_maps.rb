class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :info
      t.float :lat
      t.float :lng
      t.integer :league

      t.timestamps null: false
    end
  end
end

class AddCourtsToScores < ActiveRecord::Migration
  def change
    add_column :scores, :primary_court, :string
    add_column :scores, :secondary_court, :string
  end
end

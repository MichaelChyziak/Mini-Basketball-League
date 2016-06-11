class Team < ActiveRecord::Base
  validates :team_name, presence: true
  validates :team_name, length: { maximum: 30 }
end

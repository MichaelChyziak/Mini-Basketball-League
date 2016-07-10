class Team < ActiveRecord::Base
  #Makes sure that the team name is provided and is no more than 30 characters
  validates :team_name, presence: true
  validates :team_name, length: { maximum: 30 }

  #Enum for a teams approval into actually entering a league
  enum status: [:pending, :approved, :declined]

end

class Team < ActiveRecord::Base
  #Makes sure that the team name is provided and is no more than 30 characters
  validates :team_name, presence: true
  validates :team_name, length: { maximum: 30 }

  #Makes it so that each user added by string is properly converted to an array
  def users=(value)
    users_input = "{" + value + "}"
    self[:users] = users_input
  end

  #Enum for a teams approval into actually entering a league
  enum status: [:pending, :approved, :declined]

end

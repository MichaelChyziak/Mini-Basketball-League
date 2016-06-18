class Team < ActiveRecord::Base
  #Makes sure that the team name is provided and is no more than 30 characters
  validates :team_name, presence: true
  validates :team_name, length: { maximum: 30 }

  #For team logo's
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  #Enum for a teams approval into actually entering a league
  enum status: [:pending, :approved, :declined]

end

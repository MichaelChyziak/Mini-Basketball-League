class Map < ActiveRecord::Base
  enum league: [ :vancouver, :richmond, :surrey ]
  validates :name, presence: true
  validates :info, presence: true
  validates :lat,  presence: true
  validates :lng,  presence: true
end

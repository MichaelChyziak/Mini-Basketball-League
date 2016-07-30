class Map < ActiveRecord::Base
  enum league: [ :vancouver, :richmond, :surrey ]
end

class Map < ActiveRecord::Base
  enum league: [ :vancouver, :burnaby, :surrey ]
end

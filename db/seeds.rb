# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create!(team_name: "3 Person Team", league: "Gold", status: "pending", players_id: [1, 2, 3])
User.create(name: "user1", email: "user1@example.com", password: "useruser1", password_confirmation: "useruser1")

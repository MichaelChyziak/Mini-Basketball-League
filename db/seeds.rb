# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create!(team_name: "Empty Gold Team", league: "Gold", status: "pending", players_id: [])
User.create(name: "user1", email: "user1@example.com", password: "useruser1", password_confirmation: "useruser1")
User.create(name: "user2", email: "user2@example.com", password: "useruser2", password_confirmation: "useruser2")
User.create(name: "user3", email: "user3@example.com", password: "useruser3", password_confirmation: "useruser3")
User.create(name: "user4", email: "user4@example.com", password: "useruser4", password_confirmation: "useruser4")
User.create(name: "user5", email: "user5@example.com", password: "useruser5", password_confirmation: "useruser5")
User.create(name: "user6", email: "user6@example.com", password: "useruser6", password_confirmation: "useruser6")
User.create(name: "user7", email: "user7@example.com", password: "useruser7", password_confirmation: "useruser7")
User.create(name: "user8", email: "user8@example.com", password: "useruser8", password_confirmation: "useruser8")
User.create(name: "user9", email: "user9@example.com", password: "useruser9", password_confirmation: "useruser9")
User.create(name: "daAdmin", email: "admin@xyz.com", password: "notadmin", password_confirmation: "notjanet", admin: true)

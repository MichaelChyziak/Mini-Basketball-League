# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create!(team_name: "User1's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [1], captain_id: 1)
Team.create!(team_name: "User2's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [2], captain_id: 2)
Team.create!(team_name: "User3's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [3], captain_id: 3)
Team.create!(team_name: "User4's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [4], captain_id: 4)
Team.create!(team_name: "User5's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [5], captain_id: 5)
Team.create!(team_name: "User6's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [6], captain_id: 6)
Team.create!(team_name: "User7's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [7], captain_id: 7)
Team.create!(team_name: "User8's Van Team", team_message: "Test", league: "Vancouver", status: "approved", players_id: [8], captain_id: 8)



User.create(username: "user1", email: "user1@example.com", password: "useruser1", password_confirmation: "useruser1", team_id: 1)
User.create(username: "user2", email: "user2@example.com", password: "useruser2", password_confirmation: "useruser2", team_id: 2)
User.create(username: "user3", email: "user3@example.com", password: "useruser3", password_confirmation: "useruser3", team_id: 3)
User.create(username: "user4", email: "user4@example.com", password: "useruser4", password_confirmation: "useruser4", team_id: 4)
User.create(username: "user5", email: "user5@example.com", password: "useruser5", password_confirmation: "useruser5", team_id: 5)
User.create(username: "user6", email: "user6@example.com", password: "useruser6", password_confirmation: "useruser6", team_id: 6)
User.create(username: "user7", email: "user7@example.com", password: "useruser7", password_confirmation: "useruser7", team_id: 7)
User.create(username: "user8", email: "user8@example.com", password: "useruser8", password_confirmation: "useruser8", team_id: 8)
User.create(username: "user9", email: "user9@example.com", password: "useruser9", password_confirmation: "useruser9", team_id: 9)
User.create(username: "admin", email: "admin@xyz.com", password: "notadmin", password_confirmation: "notadmin", admin: true, super_admin: true)
League.create(name: "Vancouver")
League.create(name: "Surrey")
League.create(name: "Richmond")

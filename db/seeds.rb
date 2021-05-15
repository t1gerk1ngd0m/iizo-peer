# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
team = Team.create(slack_id: 'test_team1', slack_name: 'test_team1')
User.create(slack_id: 'test_user1', slack_name: 'test_user1', team: team)
User.create(slack_id: 'test_user2', slack_name: 'test_user2', team: team)

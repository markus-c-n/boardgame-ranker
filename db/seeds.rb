# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Creating players

p "deleting instance"
Score.delete_all
Player.delete_all
p "deleted instances"

p "creating player"
p1 = Player.create(name: "Markus", username:"Crow")
p2 = Player.create(name: "Laura", username:"Erbse")
p3 = Player.create(name: "Paul", username:"Saulus")
p "players created"

players = [p1, p2, p3]
game_modes = ["Classic", "Pearlbrook", "Bellfair"]

# Creating Scores
p "creating scores"
10.times do
  Score.create(player: players.sample, total_score:rand(30..70), city_points: rand(10..35), coin_points:rand(20), event_points:rand(18), extra_points: rand(20), game_mode: game_modes.sample)
  p "score created"
end
p "created scores"

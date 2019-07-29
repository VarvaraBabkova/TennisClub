# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.delete_all
# Rank.delete_all
# RankPair.delete_all
Player.delete_all
Participation.delete_all
Court.delete_all
Game.delete_all

c1 = Court.create(name: "Mesa Verde", address: "16020 Mesa Verde Dr")
c2 = Court.create(name: "Pool Courts", address: "16342 Havenpark Dr")
c3 = Court.create(name: "Middlebrook", address: "16206 Dunmoor Dr")


t_a = Team.create(team: "A")
t_b = Team.create(team: "B")
t_c = Team.create(team: "C")
t_d = Team.create(team: "D")
t_e = Team.create(team: "E")
t_f = Team.create(team: "F")

# r1 = Rank.create(rank: "1")
# r2 = Rank.create(rank: "2")
# r3 = Rank.create(rank: "3")
# r4 = Rank.create(rank: "4")
# r5 = Rank.create(rank: "5")
# r6 = Rank.create(rank: "6")

# rp12 = RankPair.create(first_rank_id: r1.id, second_rank_id: r2.id)
# rp13 = RankPair.create(first_rank_id: r1.id, second_rank_id: r3.id)
# rp14 = RankPair.create(first_rank_id: r1.id, second_rank_id: r4.id)
# rp15 = RankPair.create(first_rank_id: r1.id, second_rank_id: r5.id)
# rp16 = RankPair.create(first_rank_id: r1.id, second_rank_id: r6.id)
#tbc

p1 = Player.create(first_name: "Jeremy Gundling", team_id: t_a.id)
p2 = Player.create(first_name: "Yi Su", team_id: t_a.id)
p3 = Player.create(first_name: "Ashok Moza", team_id: t_a.id)
p4 = Player.create(first_name: "John McBride", team_id: t_a.id)
p5 = Player.create(first_name: "Don Hebertg", team_id: t_a.id)
p6 = Player.create(first_name: "Earl Zachry", team_id: t_a.id)

g1 = Game.create(court_id: c1.id, datetime: DateTime.new(2019,9,12,17))
g2 = Game.create(court_id: c1.id, datetime: DateTime.new(2019,9,13,17))
g3 = Game.create(court_id: c2.id, datetime: DateTime.new(2019,9,12,17))

part1 = Participation.create(player_id: p1.id, game_id: g1.id)
part2 = Participation.create(player_id: p2.id, game_id: g1.id)
part3 = Participation.create(player_id: p3.id, game_id: g1.id)
part4 = Participation.create(player_id: p4.id, game_id: g1.id)

part5 = Participation.create(player_id: p1.id, game_id: g2.id)
part6 = Participation.create(player_id: p2.id, game_id: g2.id)

part7 = Participation.create(player_id: p3.id, game_id: g3.id)
part8 = Participation.create(player_id: p4.id, game_id: g3.id)





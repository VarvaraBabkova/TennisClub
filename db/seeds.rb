require_relative "seed_players"
require_relative "seed_games"
require_relative "seed_results"



	Team.delete_all
	Rank.delete_all
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

	r1 = Rank.create(rank: "1")
	r2 = Rank.create(rank: "2")
	r3 = Rank.create(rank: "3")
	r4 = Rank.create(rank: "4")
	r5 = Rank.create(rank: "5")
	r6 = Rank.create(rank: "6")


	players = seed_players
	players.each do |p|
		Player.create(p)
	end

	seed_games
	seed_results





require 'date'

def participants_from_string (str)

	players = []
	pair1 =  str.delete(".").split("vs")[0].strip
	pair2 =  str.delete(".").split("vs")[1].strip

	team1 = pair1.split.last 
	rank1 = pair1.split(",").first
	rank2 = pair1.split(",").last[0]


	team2 = pair2.split.last 
	rank3 = pair2.split(",").first
	rank4 = pair2.split(",").last[0]

	players << Player.find_by(team: Team.find_by(team: team1).id, rank: Rank.find_by(rank: rank1).id)
	players << Player.find_by(team: Team.find_by(team: team1).id, rank: Rank.find_by(rank: rank2).id)
	players << Player.find_by(team: Team.find_by(team: team2).id, rank: Rank.find_by(rank: rank3).id)
	players << Player.find_by(team: Team.find_by(team: team2).id, rank: Rank.find_by(rank: rank4).id)

	return players
end

def get_court_id (column)
	case column
	when 1..2
		return Court.first.id
	when 3..4
		return Court.second.id
	when 5..6
		return Court.third.id
	end
end

def seed_games
	line = "1	5/14/2019	6:45 PM	1,2 A vs 1,2 B	1,2 C vs. 1,2 D	5,6 A vs. 5,6 B	5,6 C vs. 5,6 D	3,4 A vs. 3,4 B	3,4 C vs. 3,4 D
8:00 PM	1,2 E vs. 1,2 F		5,6 E vs. 5,6 F		3,4 E vs. 3,4 F	"
	seed_week(line)
end

def seed_week (line)

	players = []

	
	line1 =  line.split("\n")[0].split("\t")
	puts line1
	date = line1[1].split("/")
	time = line1[2].split(/[: ]/)
	dt1 =  DateTime.new(date[2].to_i, date[0].to_i, date[1].to_i, 
		time[0].to_i + (time[2] == "PM" ? 12 : 0), time[1].to_i)

	for i in 3..8 do
		code = line1[i]
		court = get_court_id(i - 2)
		game = Game.create(court_id: court, datetime: dt1)
		players = participants_from_string(code)
		players.each do |p|
			Participation.create(player_id: p.id, game_id: game.id)
		end
	end


	line2 =  line.split("\n")[1].split("\t")
	puts line2	
	time = line2[0].split(/[: ]/)
	dt2 =  DateTime.new(date[2].to_i, date[0].to_i, date[1].to_i, 
		time[0].to_i + (time[2] == "PM" ? 12 : 0), time[1].to_i)
	 
	for i in 2..7 do
		code = line2[i - 1]
		court = get_court_id(i - 1)
		if code != "" && code
			game = Game.create(court_id: court, datetime: dt2)
			players = participants_from_string(code)
			players.each do |p|
				Participation.create(player_id: p.id, game_id: game.id)
			end
		end
		
	end

end


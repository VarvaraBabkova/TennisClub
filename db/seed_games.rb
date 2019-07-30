require 'date'

def participants_from_string (str)
	puts str
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

	lines = ["1	5/14/2019	6:45 PM	1,2 A vs 1,2 B	1,2 C vs. 1,2 D	5,6 A vs. 5,6 B	5,6 C vs. 5,6 D	3,4 A vs. 3,4 B	3,4 C vs. 3,4 D
8:00 PM	1,2 E vs. 1,2 F		5,6 E vs. 5,6 F		3,4 E vs. 3,4 F	", 
"2	5/21/2019	6:45 PM	2,5 C vs. 2,5 F	2,5 B vs. 2,5 E	4,6 C vs. 4,6 F	4,6 B vs. 4,6 E	1,3 B vs. 1,3 E	1,3 C vs. 1,3 F
8:00 PM	2,5 A vs. 2,5 D		4,6 A vs. 4,6 D		1,3 A vs. 1,3 D	",
"3	6/11/2019	6:45 PM	5,6 A vs. 5,6 D	5,6 B vs. 5,6 F	2,3 A vs. 2,3 D	2,3 B vs. 2,3 F	1,4 A vs.1,4 D	1,4 B vs. 1,4 F
8:00 PM	5,6 C vs. 5,6 E		2,3 C vs. 2,3 E		1,4 C vs. 1,4 E",
"4	6/18/2019	6:45 PM	3,6 C vs. 3,6 F	3,6 A vs. 3,6 E	1,2 C vs. 1,2 F	1,2 A vs. 1,2 E	4,5 C vs. 4,5 F	4,5 A vs. 4,5 E
8:00 PM	3,6 B vs. 3,6 D		1,2 B vs. 1,2 D		4,5 B vs. 4,5 D",
"5	7/9/2019	6:45 PM	2,3 B vs. 2,3 C	2,3 D vs. 2,3 E	4,6 B vs. 4,6 C	4,6 D vs. 4,6 E	1,5 B vs. 1,5 C	1,5 D vs. 1,5 E
8:00 PM	2,3 A vs. 2,3 F		4,6 A vs. 4,6 F		1,5 A vs. 1,5 F",
"6	7/16/2019	6:45 PM	5,6 A vs. 5,6 B	5,6 C vs. 5,6 D	1,3 A vs. 1,3 B	1,3 C vs. 1,3 D	2,4 A vs. 2,4 B	2,4 C vs. 2,4 D
# 8:00 PM	5,6 E vs. 5,6 F		1,3 E vs. 1,3 F		2,4 E vs. 2,4 F",
"7	7/23/2019	6:45 PM 	5,6 D vs 5,6 C	5,6 B vs  5,6 E	3,4 D vs 3,4 C 	3,4 B vs 3,4 E 	1,2 D vs 1,2 C 	1,2 B vs 1,2 E
8:00 PM 	5,6 F vs 5,6 A 	3,4 F vs 3,4 A 	1,2 F vs 1,2 A",
"8	7/30/2019	6:45 PM	2,5 A vs. 2,5 E	2,5 C vs. 2,5 F	1,4 C vs. 1,4 F	1,4 A vs. 1,4 E	3,6 A vs. 3,6 E	3,6 C vs. 3,6 F
8:00 PM	2,5 B vs. 2,5 D		1,4 B vs. 1,4 D		3,6 B vs. 3,6 D	",
"9	8/6/2019	6:45 PM	2,4 B vs. 2,4 F	2,4 A vs. 2,4 D	5,6 B vs. 5,6 F	5,6 A vs. 5,6 D	1,3 B vs. 1,3 F	1,3 A vs. 1,3 D
8:00 PM	2,4 C vs. 2,4 E		5,6 C vs. 5,6 E		1,3 C vs. 1,3 E	"]
	lines.each do |line|
		puts line
		seed_week(line)
	end
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


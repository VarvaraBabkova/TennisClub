 def seed_players
 	players = []
	file_data = "		Team A	Team B	Team C	Team D	Team E	Team F	
1	Jeremy Gundling	Larry Wilson	Clay Murray	Kurt Zeller	Doug Johnson	Francis Tongol	
2	Yi Su	Ruben Flores	Subra Sankaran	Hung Nguyen	Steve Berberich	Mark Caldwell	
3	Ashok Moza	Chris Sapp	John Quinlan	Alfonso Contreras	Randy DiValerio	Bob Martin	
4	John McBride	David Purdum	Martin Walsh	Mike Baird	Steve Munday	Don Dolittle	
5	Don Hebert	Terry Tyler	Joe Khandheria	Kirit Patel	Srini Kamana	David Good	
6	Earl Zachry	Oscar Trevino	Jeff Neale	Alex Rodriguez	Terry Houvouras	Don Bane".split("\n")
	file_data.shift
	file_data.each do |line|
		rank_line = line.split("\t")
		rank = 1
		team = "A"
		rank_line.each do |name|
			if "123456".include? (name.split.first)
				rank = name.split.first.to_i
			else
				# byebug
				players << {first_name: name.split.first, 
					last_name: name.split.last,
					rank_id: Rank.find_by(rank: rank).id,
					team_id: Team.find_by(team: team).id}
					

				team  = team.next
				team = "A" if team == "G"
			end
		end
	end
	return players
 end

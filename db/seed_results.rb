def seed_results

	lines= ["Jeremy Gundling		A1	WD	WD(TA)	LD(T)	LD	LD	LD(T)	WD(T)		
Yi Su		A2	WD	WD(T)	LD	LD	WD(T)	WD	WD(T)		
Ashok Moza		A3	WD	WD(T)	LD	LD(T)	WD(T)	LD(T)	WD(T)		
John McBride		A4	WD(A)	LD(T)	LD(T)	LD	LD(A)	WD	WD(T)		
Don Hebert		A5	LD(TA)	WD(TA)	LD	LD	LD	LD	WD(T)		
Earl Zachry		A6	LD(T)	LD(T)	LD	LD(T)	LD	LD	WD(T)	",
"Larry Wilson		B1	LD	WD(T)	WD(T)	WD(T)	WD	WD(T)	LD		
Ruben Flores		B2	LD	LD	LD(T)	WD(T)	WD	LD	LD		
Chris Sapp		B3	LD(A)	WD(TA)	LD(TA)	LD(T)	WD	WD(T)	LD		
David Purdum		B4	LD	WD(TA)	WD(T)	WD(T)	LD	LD	LD		
Terry Tyler		B5	WD(T)	LD	WD	WD(T)	WD	WD	WD(T)		
Oscar Trevino		B6	WD(T)	WD(T)	WD	LD(TA)	LD	WD	WD(T)	",
"Clay Murray		C1	LD	WD(T)	WD(T)	LD	LD	WD(T)	WD(T)		
Subra Sankaran		C2	LD	WD	WD	LD	LD(A)	LD(T)	WD(T)		
John Quinlan		C3	LD(T)	WD(TA)	WD	WD	LD	WD(T)	LD(T)		
Martin Walsh		C4	LD(T)	WD	WD(T)	WD(TA)	WD	LD(T)	LD(T)		
Joe Khandheria		C5	WD(T)	WD	LD(TA)	WD(T)	LD	WD	WD(T)		
Jeff Neale		C6	WD(T)	WD	LD(T)	WD	WD	WD	WD(T)	",
"Kurt Zeller		D1	WD(A)	LD(T)	WD(T)	LD(T)	WD(A)	LD(T)	LD(T)		
Hung Nguyen		D2	WD	LD(T)	WD	LD(T)	WD	WD(TA)	LD(T)		
Alfonso Contreras		D3	WD(T)	LD(T)	WD	WD(TA)	WD	LD(T)	WD(T)		
Mike Baird		D4	WD(T)	WD(T)	WD(T)	LD(T)	LD	WD(T)	WD(T)		
Kirit Patel		D5	LD(T)	LD(T)	WD	LD(T)	WD	LD	LD(T)		
Alex Rodriguez		D6	LD(T)	WD(T)	WD(A)	WD(TA)	LD	LD	LD(T)	",
"Doug Johnson		E1	LD	LD(T)	LD(T)	WD	LD	LD(T)	WD		
Steve Berberich		E2	LD(A)	WD	LD	WD	LD(A)	WD(T)	WD		
Randy DiValerio		E3	WD(TA)	LD(T)	LD	WD(T)	LD	LD(T)	WD		
Steve Munday		E4	WD(T)	LD(T)	LD(T)	WD	WD	WD(T)	WD		
Srini Kamana		E5	WD(A)	WD	WD(T)	WD(A)	LD	WD	LD(T)		
Terry Houvouras		E6	WD	LD(T)	WD(T)	WD(T)	WD	WD	LD(T)",
"Francis Tongol		F1	WD	LD(T)	LD(T)	WD	WD(A)	WD(T)	LD(T)		
Mark Caldwell		F2	WD	LD	WD(TA)	WD	LD(TA)	LD(T)	LD(T)		
Bob Martin		F3	LD(TA)	LD(T)	WD(T)	LD	LD(T)	WD(T)	LD(T)		
Don Dolittle		F4	LD(T)	LD	LD(TA)	LD(TA)	WD	LD(T)	LD(T)		
David Good		F5	LD	LD	LD	LD(T)	WD	LD	LD(T)		
Don Bane		F6	LD	LD	LD	LD	WD	LD	LD(T)	"]

	lines.each do |line|
		person_line = line.split("\n")
		person_line.each do |pl|
			# puts pl
			

			player = Player.find_by(last_name: pl.split[1])
			games = player.games
			# puts player.inspect
			results = pl.split("\t")[3..9] 
			week = 1
			results.each do |result|
				games.each do |g|
					if g.week_num == week
						part = Participation.find_by(player_id: player.id, game_id: g.id)
						part.score = get_score(result)
						part.save
						# puts part.inspect
					end

				end
				# puts result
				week += 1
			end

		end
	end

end

def get_score(str)
	return 2 if str.include?("WD")
	return 1 if str.include?("LD") && str.include?("T")
	return 0

end



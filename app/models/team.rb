class Team < ApplicationRecord
	has_many :players
	has_many :participations, through: :players

	def games
		@games = []
		self.players.each do |p|
			p.games.each do |g|
				@games << g
			end
		end
		@games.uniq!
		@games.sort {|a, b| a.week_num <=> b.week_num}
	end

	def week_games(week)
		wg = games.select {|g| g.week_num == week}
		wg.sort {|a, b| a.court_id <=> b.court_id}
	end

	def game_score(game)
		return game.get_winner_score if self.team == game.get_winner_team
		return game.get_loser_score if self.team == game.get_loser_team
	end

	def total_score
		games.sum {|g| (self.game_score(g)? self.game_score(g) : 0) }
	end

	def games_played
		games.select {|g| g if g.played?}
	end

	def games_won
		games.select {|g| g if g.get_winner_team == self.team}
	end

	def games_lost
		games.select {|g| g if g.get_loser_team == self.team}
	end

	def self.max_score
		#byebug
		t = Team.all.max {|a, b| a.total_score <=> b.total_score}
		t.total_score
	end

	def self.lead_team
		lead_teams = Team.all.select {|t| t.total_score == Team.max_score}
		lead_teams.max {|a, b| a.games_won <=> b.games_won} if lead_teams.count > 1
		lead_teams[0]
	end
end

class Game < ApplicationRecord

	belongs_to :court
	has_many :participations
	has_many :players, through: :participations

	def get_teams
        teams = []
        players = self.players
        players.each {|p| teams  << p.team.team}
        teams.uniq!
    end

    def get_winner_team
    	p = self.participations.max {|a, b| a.score <=> b.score}
    	return p.player.team.team if p.score
    	return nil if !p.score
    end

    def get_winner_score
    	p = self.participations.max {|a, b| a.score <=> b.score}
    	return p.score if p.score
    	return nil if !p.score
    end

    def get_loser_team
    	p = self.participations.min {|a, b| a.score <=> b.score}
    	return p.player.team.team if p.score
    	return nil if !p.score
    end

    def get_loser_score
    	p = self.participations.min {|a, b| a.score <=> b.score}
    	return p.score if p.score
    	return nil if !p.score
    end

    def played?
    	self.participations.first.score
    end

end

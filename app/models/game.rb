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
end

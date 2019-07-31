class Player < ApplicationRecord
	belongs_to :team
	belongs_to :rank

	has_many :participations
	has_many :games, through: :participations

	def score(game_id)
		return Participation.find_by(player_id: self.id, game_id: game_id).score
	end

	def self.team_players(team_name)
        team_id = Team.find_by(team: team_name)
        return Player.where(team_id: team_id) 
    end

     def self.rank_players(rank)
        rank_id = Rank.find_by(rank: rank)
        return Player.where(rank_id: rank_id) 
    end

end

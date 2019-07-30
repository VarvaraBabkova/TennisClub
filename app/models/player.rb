class Player < ApplicationRecord
	belongs_to :team
	belongs_to :rank

	has_many :participations
	has_many :games, through: :participations

	def score(game_id)
		return Participation.find_by(player_id: self.id, game_id: game_id).score
	end
end

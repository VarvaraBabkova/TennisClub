class Player < ApplicationRecord
	belongs_to :team
#	has_many :rank_pairs, through: :rank
	has_many :participations
	has_many :games, through: :participations
end

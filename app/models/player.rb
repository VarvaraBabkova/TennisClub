class Player < ApplicationRecord
	belongs_to :team
	belongs_to :rank

	has_many :participations
	has_many :games, through: :participations
end

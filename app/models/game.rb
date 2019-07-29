class Game < ApplicationRecord

	belongs_to :court
	has_many :participations
	has_many :players, through: :participations
end

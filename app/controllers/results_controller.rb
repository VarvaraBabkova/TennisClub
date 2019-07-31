class ResultsController < ApplicationController

	def index
		@teams = Team.all
		@games  = Game.all
		@players = Player.all
	end

	def show
		@teams = Team.all

	end
end

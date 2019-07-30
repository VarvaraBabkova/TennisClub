class GamesController < ApplicationController
    
    before_action :current_game, only: [:show]
    def index
        @games = Game.all
    end

    def show
    end

    private
    def current_game
        @game = Game.find(params[:id])
    end
end

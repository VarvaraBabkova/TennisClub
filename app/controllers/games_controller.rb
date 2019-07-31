class GamesController < ApplicationController
    
    before_action :current_game, only: [:show]
    def index
        @games = Game.all
        @courts = Court.all
    end

    def show
        @players = @game.players
        @teams = @game.get_teams
    end

    

    private
    def current_game
        @game = Game.find(params[:id])
    end

    
end

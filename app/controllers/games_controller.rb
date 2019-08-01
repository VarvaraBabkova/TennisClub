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

    def update
        
        @game = Game.find(params[:id])
        
        @game.datetime.change(year: params[:game]["datetime(1i)"])
        @game.datetime.change(month: params[:game]["datetime(2i)"])
        @game.datetime.change(day: params[:game]["datetime(3i)"])

        @game.update(game_params)
        redirect_to @game 
    end

    private
    def current_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.require(:game).permit(:datetime)
    end

    
end

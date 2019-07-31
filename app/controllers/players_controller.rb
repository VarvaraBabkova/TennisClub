class PlayersController < ApplicationController
    before_action :current_player, only: [:show]
    def index
        @players = Player.all

    end

    def show
        @participations = @player.participations
        @img_name = @player.first_name + " " + @player.last_name + ".jpg"
    end

    private
    def current_player
        @player = Player.find(params[:id])
    end

end

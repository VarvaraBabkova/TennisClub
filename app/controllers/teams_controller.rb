class TeamsController < ApplicationController
    before_action :current_team, only: [:show]
    def index
        @teams = Team.all
        @players = Player.all
        @ranks = Rank.all
        @players_ranked = []
        for i in 1..6 do
            @players_ranked[i] = Player.rank_players(i)
        end

    end
    
    def show        
        @team_games = @team.games
        @team_players = @team.players
    end
    
    private
    def current_team
        @team = Team.find(params[:id])
    end
end

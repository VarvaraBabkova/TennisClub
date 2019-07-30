class TeamsController < ApplicationController
    before_action :current_team, only: [:show]
    def index
        @teams = Team.all
    end
    
    def show
        current_team
    end
    
    private
    def current_team
        @team = Team.find(params[:id])
    end
end

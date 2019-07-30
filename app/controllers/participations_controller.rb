class ParticipationsController < ApplicationController

    before_action :current_participation, only: [:show]
    def index
        @participations = Participation.all
    end
    
    def show
    end

    private
    def current_participation
        @participation = Participation.find(params[:id])
    end
end

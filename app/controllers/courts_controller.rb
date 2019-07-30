class CourtsController < ApplicationController
    before_action :current_court, only: [:show]
    def index
        @courts = Court.all
    end
    
    def show
    end


    private
    def current_court
        @court = Court.find(params[:id])
    end
end

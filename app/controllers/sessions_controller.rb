class SessionsController < ApplicationController 
	# skip_before_filter :verify_authenticity_token
    def new
        # nothing to do here!
    end
 
    def login
    	
        if !session[:userID] 
        	if params[:password] == "12345"
        	   session[:userID] = "admin"
            else
                session.delete :userID
            end
        end
        # byebug
        # render :file => "c:/path/to/some/template.erb"
        redirect_to "/"
    end

	def destroy
  		session.delete :userID
  		redirect_to '/'

  		
	end

end
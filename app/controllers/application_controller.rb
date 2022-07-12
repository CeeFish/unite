class ApplicationController < ActionController::Base
before_action :authorized
helper_method :current_user
helper_method :logged_in?
    
# Handles the current user’s information
    def current_user
        User.find_by(id: session[:user_id])
    end
    
# Keep track of our current user, but also to check whether they are logged in
    def logged_in?
        !current_user.nil?
    end

    def authorized
    redirect_to '/welcome' unless logged_in?
    end
end

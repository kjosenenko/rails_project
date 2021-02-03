class ApplicationController < ActionController::Base
    helper_method  :current_user, :logged_in?, :require_login, :require_owns_listing, :owns_listing?
    private 

    def require_owns_listing
        redirect_to controller: 'listings', action: 'index' unless owns_listing?
    end

    def owns_listing?
        current_user == @listing.user
    end

    def require_login
        redirect_to controller: 'listings', action: 'index' unless logged_in?
    end

    def current_user
        User.find(session[:user_id]) 
    end 

    def logged_in? 
        !!session[:user_id]
    end
end

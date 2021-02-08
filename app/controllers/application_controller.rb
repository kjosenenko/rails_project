class ApplicationController < ActionController::Base
    
    helper_method  :current_user, :logged_in?, :require_login, :require_owns_listing, :owns_listing?, :other_users, :require_in_conversation
    
    private 

    def require_owns_listing
        redirect_to controller: 'listings', action: 'index' unless owns_listing?
    end

    def owns_listing?
        current_user == @listing.user
    end

    def require_in_conversation
        redirect_to controller: 'conversations', action: 'index' unless in_conversation?
    end

    def in_conversation?
        @conversation.users.include?(current_user)
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

    def other_users
        @other_users = @conversation.users.reject { |user| user.id == current_user.id}
    end

end

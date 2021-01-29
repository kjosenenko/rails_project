class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :github

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        user = user.try(:authenticate, params[:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        session[:user_id] = user.id
        @user = user
        redirect_to '/'
      end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    def github
        pp request.env['omniauth.auth']
        @user = User.find_or_create_by(username: request.env['omniauth.auth']['info']['nickname']) do |user| 
            user.password =  SecureRandom.hex(10)
        end
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to "/login"
        end
    end
end

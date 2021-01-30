class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :github

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        user = user.try(:authenticate, params[:password])
        if user
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:error] = ["There was a problem logging in. Please make sure you use the correct username & password."]
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
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
            flash[:error] = ["There was a problem logging in."]
            render :new
        end
    end
end

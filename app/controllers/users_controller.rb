class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)
            if @user.save
            return redirect_to controller: 'users', action: 'new' unless @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash.now[:error] = @user.errors.full_messages
            render :new
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end

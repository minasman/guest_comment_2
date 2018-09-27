class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.notice = "Error Creating User"
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :position, :email, :password)
    end

end

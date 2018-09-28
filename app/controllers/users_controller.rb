class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            if @user.position == "Director"
                Director.create(user_id: @user.id)
            end
            redirect_to user_path(@user)
        else
            flash.notice = "Error Creating User"
            render :new
        end
    end

    def show
        @user = User.find(session[:user_id])
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :position, :email, :password)
    end



end

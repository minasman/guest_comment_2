class SessionsController < ApplicationController
    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        @user.try(:authenticate, params[:password])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.notice = "Username and/or Password Not Found"
            redirect_to signin_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end

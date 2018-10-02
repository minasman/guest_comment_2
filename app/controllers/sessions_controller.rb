class SessionsController < ApplicationController
    before_action :require_log_in, except: [:new, :create, :welcome ,:facebook]

    def welcome
    end

    def new
        @user = User.new
    end

    def facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.first_name = u.name.split(' ')[0]
            u.last_name = u.name.split(' ')[1]
            u.position = "Manager"
            u.username = u.first_name
            u.password = u.last_name
          end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user.try(:authenticate, params[:user][:password])
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
    private
    def auth
        request.env['omniauth.auth']
    end
end

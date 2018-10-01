class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_log_in, except: [:new, :create, :welcome]

    def index
    end

    def show
    end

    def new
        @user = User.new
    end

    def edit
        if params[:id].to_i != session[:user_id]
            @user = User.find(session[:user_id])
            render :show
        end
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash.notice = "Successfully Created User"
            redirect_to user_path(@user)
        else
            flash.alert = "Error Creating User"
            render :new
        end
    end

    def update
        if @user.update(user_params)
            flash.notice = "Successfully Updated User"
            redirect_to user_path(@user)
        else
            flash.alert = "Error Updating User"
            render :edit
        end
    end

    def destroy
    end



    private
    def set_user
        @user = User.find(session[:user_id])
    end
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :position, :email, :password)
    end

end

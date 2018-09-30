class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_log_in, except: [:new, :create, :welcome]

    def index
    end

    def show
        stores = Store.all
        @user_stores = []
        if @user.position == "General Manager"
            @user_stores = Store.find_by(gm_id: @user.id)
        elsif @user.position == "Supervisor"
            @user_stores = Store.where(supervisor_id: @user.id)
        elsif @user.position == "Operations Manager"
            @user_stores = Store.where(om_id: @user.id)
        else
            @user_stores = Store.all
        end
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
            redirect_to user_path(@user)
        else
            flash.notice = "Error Creating User"
            render :new
        end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash.notice = "Error Updating User"
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

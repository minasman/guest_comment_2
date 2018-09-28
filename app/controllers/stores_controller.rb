class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
        @store = Store.new
    end

    def edit
    end

    def create

    end

    def update
        if @store.update(store_params)
            redirect_to user_path(session[:user_id])
        else
            render :edit
        end
    end

    def destroy
    end

    private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
        params.require(:store).permit(:name, :store_number, :street_address, :store_email, :city, :state, :zip, :phone, :owner_id, :director_id, :om_id, :supervisor_id, :gm_id)
    end

end
class GuestsController < ApplicationController
    before_action :set_guest, only: [:show, :edit, :update, :destroy]

    def index
        @guests = Guest.all
    end

    def show
    end

    def new
        @guest = Guest.new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end

    private
    def set_guest
        @guest = Guest.find(session[:user_id])
    end

end

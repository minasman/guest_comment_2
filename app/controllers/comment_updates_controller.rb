class CommentUpdatesController < ApplicationController
    before_action :set_comment_update, only: [:show, :edit, :update, :destroy]
    before_action :require_log_in

    def index
        @updates = CommentUpdate.all
    end

    def show
    end

    def new
        @comment = Comment.find(params[:comment_id])
        @update = CommentUpdate.new
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
    def set_comment_update
        @update = CommentUpdate.find(session[:user_id])
    end
end

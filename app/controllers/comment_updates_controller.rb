class CommentUpdatesController < ApplicationController
    before_action :set_comment, only: [:new, :index, :create]
    before_action :require_log_in

    def index
    end

    def new
        @comment.comment_updates.build
    end

    def create
        @comment_update = @comment.comment_updates.create(comment_params)
        flash.notice = "Comment Successfully Added"
        if params[:comment_update][:status] && params[:comment_update][:status] == "Closed"
            @comment.status = "Closed"
            @comment.save
        end
        redirect_to comment_path(@comment)
    end

    private
    def set_comment
        @comment = Comment.find(params[:comment_id])
    end
    def comment_params
        params.require(:comment_update).permit(:update_date, :update_time, :update_type, :employee_name, :current_update, :comment_id)
    end
end

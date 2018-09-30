class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    before_action :require_log_in

    def index
        @comments = Comment.all.order("store_id")

    end

    def show
    end

    def new
        @comment = Comment.new
        @comment.guest = Guest.new
    end

    def edit
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.save
            flash.alert = "Comment Successfully Added"
            redirect_to user_path(session[:user_id])
        else
            flash.alert = "Error Creating Comment"
            render :new
        end
    end

    def update
        @comment.update = CommentUpdate.new
    end

    def destroy
    end

    private
    def set_comment
        @comment = Comment.find(session[:user_id])
    end
    def comment_params
        params.require(:comment).permit(:visit_date, :visit_time, :comment_type, :source, :urgent, :case_number, :first_issue, :first_issue_comment, :second_issue, :second_issue_comment, :third_issue, :third_issue_comment, :contact_type, :visit_type, :employee_named, :status, :guest_id, :store_id,
            guest_attributes: [:first_name, :last_name, :phone, :email])
    end

end

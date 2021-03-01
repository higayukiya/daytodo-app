class CommentsController < ApplicationController
    before_action :authenticate_user!

    def new
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:task_id])
        @comment = @task.comments.build(comment_params)
        @comment.save!
        redirect_to board_task_path(@board, @task)
    end

    private
    def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end
end

class TasksController < ApplicationController
    before_action :authenticate_user!

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def edit
        @task = current_user.tasks.find(params[:id])
    end
    
    def update
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
          redirect_to task_path(@task), notice: '更新できました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end
    

    def create
        @user = current_user
        board = @user.boards.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save!
          redirect_to board_task_path(board, @task), notice: '保存できたよ'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
    end
    
    
    def destroy
      @user = current_user
      board = @user.boards.find(params[:board_id])
        board.tasks.destroy
        redirect_to board_path(board), notice: '削除に成功しました'
    end
    
    
    private
      def task_params
        params.require(:task).permit(:title, :description, :endday, :eyecatch)
      end
end
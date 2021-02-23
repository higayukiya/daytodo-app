class TaskController < ApplicationController
    before_action :authenticate_user!

    def new
        board = Board.find(params[:id])
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
        board = Board.find(params[:id])
        @task = board.tasks.build(task_params)
        if @task.save!
          redirect_to task_path(@task), notice: '保存できたよ'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
    end
    
    
    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to @board_path, notice: '削除に成功しました'
    end
    
    
    private
      def task_params
        params.require(:task).permit(:title, :description, :endday, :eyecatch)
      end
end
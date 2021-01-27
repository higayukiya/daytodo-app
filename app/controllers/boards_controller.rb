class BoardsController < ApplicationController
  def Index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      rendirect_to board_path(@board), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗'
      render :new
    end
  end
end
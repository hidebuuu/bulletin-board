class Admin::BoardsController < AdminController
  before_action :set_board, only: %i[show destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result
  end

  def show; end


  def destroy
    @board.destroy
    redirect_to boards_path, success: "掲示板: #{@board.title}の削除が完了しました"
  end


  def set_board
    @board = Board.find_by(id: params[:id])
  end
end

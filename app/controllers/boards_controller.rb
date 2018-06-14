class BoardsController < GeneralController

  def index
    @boards = Board.all.order(created_at: 'desc')
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :description, :image).merge(user_id: current_user.id)
  end
end

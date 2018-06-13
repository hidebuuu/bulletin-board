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
      redirect_to boards_path, success: '掲示板の作成が完了しました'
    else
      flash.now[:danger] = 'エラーが発生したため、掲示板を作成できません'
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :description, :image).merge(user_id: current_user.id)
  end
end

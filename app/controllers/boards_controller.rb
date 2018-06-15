class BoardsController < GeneralController

  def index
    @boards = Board.all.order(created_at: 'desc')
    @boards = Board.page(params[:page]).per(5)
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @board.comments.all.order(created_at: :desc)
    @comments = @board.comments.page(params[:page]).per(5)
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

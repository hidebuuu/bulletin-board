class BoardsController < GeneralController
  before_action :ensure_correct_user, only: :edit

  def index
    @boards = Board.all.order(created_at: 'desc').page(params[:page]).per(5)
  end

  def new
    @board = Board.new
  end

  def show
    @board = Board.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @board.comments.all.order(created_at: :desc).page(params[:page]).per(5)
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

  def edit
    @board = Board.find_by(id: params[:id])
  end

  def update
    @board = Board.find_by(id: params[:id])
    @board.update(board_params)

    if @board.save
      redirect_to boards_path, success: '投稿内容を編集しました。'
    else
      flash.now[:danger] = 'もう一度入力してください。'
      render :new
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    @board.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to boards_path, success: "掲示板: #{@board.title}の削除が完了しました"
  end

  private

  def board_params
    params.require(:board).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @board = Board.find_by(id: params[:id])
    if @board.user_id != @current_user.id
      redirect_to boards_path, danger: '権限がありません'
    end
  end
end

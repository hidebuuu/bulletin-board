class BoardsController < GeneralController
  before_action :set_board
  before_action :ensure_correct_user, only: %i[edit destroy]
  after_action :create_notification, only: %i[create]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).page(params[:page])
  end

  def new
    @board = Board.new
  end

  def show
    @comment = Comment.new
    @comments = @board.comments.all.order(created_at: :desc).page(params[:page]).per(5)
    @follow = current_user.my_follow(@board)
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

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to boards_path, success: '投稿内容を編集しました。'
    else
      flash.now[:danger] = 'もう一度入力してください。'
      render :new
    end
  end

  def destroy
    @board.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to boards_path, success: "掲示板: #{@board.title}の削除が完了しました"
  end

  private

  def board_params
    params.require(:board).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    redirect_to boards_path, danger: '権限がありません' if @board.user_id != current_user.id
  end

  def set_board
    @board = Board.find_by(id: params[:id])
  end

  def create_notification
    return if @board == current_user
    current_user.notifications.create(target: @board)
  end
end

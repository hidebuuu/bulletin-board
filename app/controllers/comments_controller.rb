class CommentsController < GeneralController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_board

  def create
    @comment = @board.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def update
    set_comment if !@comment.update(comment_params)
    respond_to do |format|
        format.html { redirect_to :back }
        format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, board_id: params[:board_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end
end

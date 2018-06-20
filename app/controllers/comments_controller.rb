class CommentsController < GeneralController

  def create
    @board = Board.find_by(id: params[:board_id])
    @comment = @board.comments.new(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board), success: 'コメントを投稿しました。'
    else
      redirect_to board_path(@comment.board), danger: '空ではコメントできません。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, board_id: params[:board_id])
  end
end

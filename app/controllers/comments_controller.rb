class CommentsController < GeneralController

  def create
    @board = Board.find_by(id: params[:board_id])
    @comments = @board.comments.build(comment_params)
    if @comments.save
      redirect_to board_path(id: params[:board_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, board_id: params[:board_id])
  end
end

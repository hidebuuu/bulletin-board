class FollowsController < ApplicationController
  before_action :set_follow, only: %i[destroy]

  def index
    @boards = Board.followed_boards(current_user).page(params[:page]).per(10)
  end

  def create
    @follow = Follow.new(user_id: current_user.id, board_id: params[:board_id])
    if @follow.save
      @board = @follow.board
      respond_to do |format|
      format.html { redirect_to :back }
      format.js
      end
    end
  end

  def destroy
    if @follow.destroy
      @board =  @follow.board
      respond_to do |format|
      format.html { redirect_to :back }
      format.js
      end
    end
  end

  private

  def set_follow
    @follow = Follow.find(params[:id])
  end
end

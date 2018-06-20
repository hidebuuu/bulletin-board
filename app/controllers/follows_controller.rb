class FollowsController < ApplicationController

  def create
    @follow = Follow.new(user_id: current_user.id, board_id: params[:board_id])
    if @follow.save
    redirect_to :back , success: 'お気に入りに登録しました。'
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to :back , danger: 'お気に入りを解除しました。'
  end
end

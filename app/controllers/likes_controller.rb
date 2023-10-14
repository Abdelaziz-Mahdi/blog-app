class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    @like.save
    redirect_to request.referrer
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to request.referrer
  end
end

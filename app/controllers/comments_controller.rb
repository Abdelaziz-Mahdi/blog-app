class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = 'Post created successfully!'
      redirect_to user_post_path(current_user, @comment.post)
    else
      redirect_to request.referrer
      flash[:warning] = 'Comment not created!'
    end
  end
end

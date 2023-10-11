class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author_id = current_user.id
    if @post.save
      flash[:success] = 'Post created successfully!'
      redirect_to user_posts_path
    else
      redirect_to request.referrer
      flash[:warning] = 'Post not created!'
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end
end

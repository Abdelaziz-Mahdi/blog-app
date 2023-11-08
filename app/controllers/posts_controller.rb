class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  def new
    if user_signed_in? && current_user.id == params[:user_id].to_i
      @post = Post.new
    else
      redirect_to request.referrer
      flash[:warning] = 'You are not authorized to view this page!'
    end
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
    @post = Post.includes(:author, :likes, comments: [:author] ).find_by_id(params[:id])
    @post_comments = @post.comments
    @post_like = @post.likes[0]
    @post_author = @post.author
    @post_comment_author = @post_comments.map(&:author).flatten
  end
end

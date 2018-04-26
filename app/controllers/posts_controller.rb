class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post successfully posted yaaa"
      redirect_to user_posts_path(current_user)
    else
      render:new
    end
  end

  def show
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :image)
  end
end

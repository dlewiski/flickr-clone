class HomeController < ApplicationController
  def index
    @users = User.all
    @posts = Post.includes(:user)
  end
end

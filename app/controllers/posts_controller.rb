class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all
    if @post.name = ""
      @post.name = "名無し"
    end
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :rule_id, :room_number, :text, :password)
  end
end

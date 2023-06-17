class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: "DESC")
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all.order(created_at: "DESC")
    if @post.name = ""
      @post.name = "名無し"
    end
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @posts = Post.where(rule_id: params[:id])
    @rule = Rule.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    password = params[:password]
    no_password_alert = "この投稿にはパスワードが設定されていません"
    wrong_password_alert = "パスワードが間違っています"
    blank = ""

    if post.password == nil
      render json: { text: no_password_alert }
    elsif post.password == password.to_i
      post.destroy
      render json: { text: blank }
    else
      render json: { text: wrong_password_alert }
    end

  end
  
  private
  def post_params
    params.require(:post).permit(:name, :rule_id, :room_number, :text, :password)
  end
end

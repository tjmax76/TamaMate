class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(5)
    keep_id("/")
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(5)
    current_url = request.headers['Referer']
    id = session[:id]
    if id.to_i != 0
      @rule = Rule.find(id)
    end
      
    
    if params[:post][:name] == ""
      @post.name = "名無し"
    end
    
    if @post.save
      after_save(id)
    else
      faild_save(id)
    end
  end
  
  def show
    @post = Post.new
    @posts = Post.where(rule_id: params[:id]).order(created_at: "DESC").page(params[:page]).per(5)
    @rule = Rule.find(params[:id])
    keep_id(params[:id])
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

  def succeeded_save(id)
    if id.match(/\/$/)
      redirect_to root_path
    else
      redirect_to post_path(id)
    end
  end
  
  def faild_save(id)
    if id.match(/\/$/)
      render :index
    else
      render :show
    end
  end
    
    def keep_id(id)
      session[:id] = id
    end
  end
  
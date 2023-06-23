class CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    comments = post.comments.order(created_at: "DESC")
    render json: { comments: comments, post: post }
  end

  def create
    @post = Post.find(params[:post_id])
    @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(5)
    @comment = Comment.new(comment_params)
    id = session[:id]
    if id.to_i != 0
      @rule = Rule.find(id)
    end
    set_name(@comment)

    if @comment.save
      succeeded_save(id)
    else
      faild_save(id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :text, :password).merge(post_id: params[:post_id])
  end
end

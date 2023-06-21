class CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    comments = post.comments.order(created_at: "DESC")
    render json: { comments: comments, post: post }
  end

  def create
  end
end

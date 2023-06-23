class ApplicationController < ActionController::Base
  before_action :set_comment


  def succeeded_save(id)
    if id.match(/\/$/)
      redirect_to root_path
    else
      redirect_to post_path(id)
    end
  end
  
  def faild_save(id)
    if id.match(/\/$/)
      render template: "posts/index"
    else
      render template: "posts/show"
    end
  end
    
  def keep_id(id)
    session[:id] = id
  end

  def set_comment
    @comment = Comment.new
  end

  def set_name(instance)
    if instance.name == ""
      instance.name = "名無し"
    end
  end
end

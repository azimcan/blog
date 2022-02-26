class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new comment_params
    @comment.user = current_user.nil? ? nil : current_user
    if @comment.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.required(:comment).permit(:content)
  end
end

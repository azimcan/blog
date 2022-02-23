class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new comment_params
    @comment.user = current_user.nil? ? nil : current_user
    @comment.save

    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.required(:comment).permit(:content)
  end
end

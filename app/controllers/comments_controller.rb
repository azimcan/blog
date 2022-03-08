class CommentsController < ApplicationController
  before_action :set_post

  def index; end

  def create
    @comment = @post.comments.new comment_params
    @comment.user = current_user.nil? ? nil : current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:comments, partial: "comments/comment", locals: { comment: @comment })
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {}
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@comment)
      end
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

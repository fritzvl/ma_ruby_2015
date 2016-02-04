class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]

    redirect_to post_path @post if @post.comments.create comment_params
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

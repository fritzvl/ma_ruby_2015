class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    comment = @post.comments.new(comment_params)
    comment.user = current_user

    redirect_to post_path @post if comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

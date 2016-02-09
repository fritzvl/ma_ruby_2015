# == Schema Information
# Schema version: 20160209112606
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer          indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#


class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

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

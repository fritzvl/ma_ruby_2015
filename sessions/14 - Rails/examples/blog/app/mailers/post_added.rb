class PostAdded < ApplicationMailer
  def notify user, post
    @user = user
    @post = post

    @url = 'http://localhost'

    mail(to: @user.email, subject: "'#{@post.title}' added by #{@user.email}")
  end
end

class SendMailJob < ActiveJob::Base
  queue_as :default

  def perform post
    PostAdded.notify(post.author, post).deliver_now
  end
end

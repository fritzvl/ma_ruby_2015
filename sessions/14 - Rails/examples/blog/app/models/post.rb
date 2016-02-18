# == Schema Information
# Schema version: 20160209113231
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  after_create :notify_by_mail

  private

  def notify_by_mail
    SendMailJob.perform_later self
  end

end

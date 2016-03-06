# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#  user_id    :integer
#

class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, PostImageUploader

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true

  default_scope order: 'posts.created_at DESC'

end

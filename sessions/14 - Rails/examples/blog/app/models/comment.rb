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

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end

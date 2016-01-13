require 'active_record'

class Post < ActiveRecord::Base
  belongs_to :user
end
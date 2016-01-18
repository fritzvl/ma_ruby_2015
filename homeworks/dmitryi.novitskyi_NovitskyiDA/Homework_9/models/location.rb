require "sinatra/activerecord"

class Location < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :body
end
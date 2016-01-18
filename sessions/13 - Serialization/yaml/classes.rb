require 'yaml'
require 'awesome_print'

class User
  def initialize(fname, lname)
    @name = "#{fname.capitalize} #{lname.capitalize}"
  end

  def name
    @name
  end
end

class Post
  def initialize(body, author)
    @body = body
    @author = author
  end

  def body
    @body
  end

  def author
    @author
  end
end
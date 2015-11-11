

#
# Basic object
#
class User
  attr_accessor :username, :email, :role
end

#
# Builder 
#
class BuilderUser
  attr_reader :user

  def create_new_user
    @user = User.new
  end

  def get_user
    "User username: #{@user.username}, email: #{@user.email}, role: #{@user.role}"
  end
end

#
# BuilderUserSimple - build user with role simple user
#
class BuilderUserSimple < BuilderUser
  def build_username  
    @user.username = 'simple_user'
  end

  def build_email
    @user.email = 'simple@gmail.com'
  end

  def build_role
    @user.role = 'simple_user'
  end
end

#
# BuilderUserModerator - build user with role moderator
#
class BuilderUserModerator < BuilderUser
  def build_username  
    @user.username = 'moderator_user'
  end

  def build_email
    @user.email = 'moderator@gmail.com'
  end

  def build_role
    @user.role = 'moderator'
  end
end

#
# Admin - main class
#
class Admin
  def set_builder_user(bp)
    @builder_user = bp
  end

  def get_user
    @builder_user.get_user
  end

  def construct_user
    @builder_user.create_new_user
    @builder_user.build_username
    @builder_user.build_email
    @builder_user.build_role
  end
end

admin = Admin.new

builder_user_simple = BuilderUserSimple.new
builder_user_moderator  = BuilderUserModerator.new

admin.set_builder_user(builder_user_simple)
admin.construct_user

puts admin.get_user


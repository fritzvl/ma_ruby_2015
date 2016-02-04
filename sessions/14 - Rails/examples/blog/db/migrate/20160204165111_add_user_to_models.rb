class AddUserToModels < ActiveRecord::Migration
  def change
    add_belongs_to :posts, :user
    add_belongs_to :comments, :user
  end
end

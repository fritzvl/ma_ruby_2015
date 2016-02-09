class ChangePostOwner < ActiveRecord::Migration
  def change
    rename_column :posts, :user_id, :author_id
  end
end

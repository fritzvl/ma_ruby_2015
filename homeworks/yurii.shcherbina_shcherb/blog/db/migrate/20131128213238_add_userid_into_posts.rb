class AddUseridIntoPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, [:user_id, :created_at]
  end
end

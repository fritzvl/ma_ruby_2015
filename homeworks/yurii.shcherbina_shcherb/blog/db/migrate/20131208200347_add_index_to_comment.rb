class AddIndexToComment < ActiveRecord::Migration
  def change
      add_index :comments, [:post_id, :created_at]
      add_index :comments, [:user_id, :created_at]
  end
end

class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts, force: true do |t|
      t.text :body
      t.belongs_to :user, index: true
    end
  end
end
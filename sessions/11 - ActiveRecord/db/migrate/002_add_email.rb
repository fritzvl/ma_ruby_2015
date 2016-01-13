class AddEmail < ActiveRecord::Migration

  def up
    add_column :users, :email, :string, default: ''
  end

  def down
    remove_column :users, :email
  end

end
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :passwd
      t.timestamp :created_at
    end
  end
end

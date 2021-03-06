class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.integer :user_id
      t.integer :role
      t.string  :team
      t.timestamps
    end
  end
end

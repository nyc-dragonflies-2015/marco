class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name # seems like you might want to require these as well
      t.string :email
      t.string :password_hash

      t.timestamps null: false
    end
  end
end

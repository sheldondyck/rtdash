class CreateSystemUsers < ActiveRecord::Migration
  def change
    create_table :system_users do |t|
      t.string :name,                 :null => false
      t.string :account,              :null => false
      t.string :encrypted_password,   :null => false
      t.string :salt,                 :null => false
      t.timestamps
    end
  end
end

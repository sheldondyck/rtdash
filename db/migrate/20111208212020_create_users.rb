class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,                 :null => true
      t.string :email,                :null => true
      t.string :encrypted_password,   :null => true
      t.string :salt                  :null => true

      t.timestamps
    end
  end
end

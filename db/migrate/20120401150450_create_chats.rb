class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :user,   :null => false
      t.datetime :instant,  :null => false
      t.string :message,    :null => false

      t.timestamps
    end
    add_index :chats, :user_id
    add_foreign_key(:users, :chats)
  end
end

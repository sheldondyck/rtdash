class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references    :system_user,    :null => false
      #t.foreign_key   :system_users,   :null => false
      t.datetime      :instance,       :null => false
      t.string        :title,          :null => false
      t.string        :message,        :null => false
      t.string        :url,            :null => false
      t.timestamps
    end
    add_foreign_key(:system_users, :blogs)
    add_index :blogs, :url
  end
end

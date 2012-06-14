# == Schema Information
#
# Table name: blogs
#
#  id             :integer          not null, primary key
#  system_user_id :integer          not null
#  instance       :datetime         not null
#  title          :string(255)      not null
#  message        :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Blog do
  before :each do
    @user_attr = {:name => "User Name",
                  :account => "user_account",
                  :password => "user_password"}
    @attr = {:title => "Blog Title",
            :message => "Blog message.",
            :instance => '2012-01-01T00:00:00',
            :url => 'blog_url'}
    @sys_user = SystemUser.create(@user_attr)
  end

  it "should create a new instance given valid attributes" do
    @sys_user.blogs.create! @attr
  end
end

# == Schema Information
#
# Table name: chats
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  instant    :datetime        not null
#  message    :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Chat do

  before :each do
    @user_attr = { :name => "Example User",
      :email => "user@example.com",
      :password => "user_password" }
    @attr = { :message => "example message" }
    @user = User.create! @user_attr
  end

  it "should create a new instance given valid attributes" do
    @user.chat.create! @attr
  end

  it "should require a user" do
    no_user_chat = Chat.new @attr
    no_user_chat.should_not be_valid
  end

  it "should require a message" do
    no_msg_chat = @user.chat.new(@attr.merge(:message => ""))
    no_msg_chat.should_not be_valid
  end

  it "should reject messages that are too long" do
    long_msg = "a" * 256
    long_msg_chat = @user.chat.new(@attr.merge(:message => long_msg))
    long_msg_chat.should_not be_valid
  end

  it "should reject names that are too short" do
    short_msg = "a"
    short_msg_chat = @user.chat.new(@attr.merge(:message => short_msg))
    short_msg_chat.should_not be_valid
  end

  # TODO: add tests for instant
  it "instant should be now" do
    chat = @user.chat.create! @attr
  end
end

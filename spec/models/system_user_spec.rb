# == Schema Information
#
# Table name: system_users
#
#  account            :string(255)      not null
#  created_at         :datetime         not null
#  encrypted_password :string(255)      not null
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  salt               :string(255)      not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe SystemUser do
  before :each do
    @attr = { 
      :name => "User Name",
      :account => "user_account",
      :password => "user_password" }
  end

  it "should create a new instance given valid attributes" do
    SystemUser.create! @attr
  end
end

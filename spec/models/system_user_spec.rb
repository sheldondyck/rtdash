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

  it "should require a name" do
    no_name_user = SystemUser.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a account" do
    no_account_user = SystemUser.new(@attr.merge(:account => ""))
    no_account_user.should_not be_valid
  end

  it "should require a password" do
    no_password_user = SystemUser.new(@attr.merge(:password => ""))
    no_password_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = SystemUser.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject names that are too short" do
    short_name = "a"
    short_name_user = SystemUser.new(@attr.merge(:name => short_name))
    short_name_user.should_not be_valid
  end

  it "should accept valid accounts" do
    accounts = %w[system_user THE_SYS_USER_1 sysuser sys1user system.user]
    accounts.each do |account|
      valid_account_user = SystemUser.new(@attr.merge(:account => account))
      valid_account_user.should be_valid
    end
  end

  it "should reject invalid accounts" do
    accounts = %w[user@foo.com 1_user_at_foo.org example.user@foo .user]
    accounts.each do |account|
      invalid_account_user = SystemUser.new(@attr.merge(:account => account))
      invalid_account_user.should_not be_valid
    end
  end

  it "should reject duplicate accounts" do
    # Put a system_user with given accounts into the database.
    SystemUser.create!(@attr)
    user_with_duplicate_account = SystemUser.new(@attr)
    user_with_duplicate_account.should_not be_valid
  end

  it "should reject accounts identical up to case" do
    upcased_account = @attr[:account].upcase
    SystemUser.create!(@attr.merge(:account => upcased_account))
    user_with_duplicate_account = SystemUser.new(@attr)
    user_with_duplicate_account.should_not be_valid
  end

  describe "password validations" do
    it "should require a password" do
      SystemUser.new(@attr.merge(:password => ""))
      should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short)
      SystemUser.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 51
      hash = @attr.merge(:password => long)
      SystemUser.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @system_user = SystemUser.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @system_user.should respond_to(:password)
    end

    it "should set the encrypted password" do
      @system_user.password.should_not be_blank
    end

    describe "has_password? method" do

      it "should be true if the passwords match" do
        @system_user.has_password?(@attr[:password]).should be_true
      end

      it "should be false if the passwords don't match" do
        @system_user.has_password?("invalid").should be_false
      end
    end

    describe "authenticate method" do

      it "should have an autenticate attribute" do
        SystemUser.should respond_to(:authenticate)
      end

      it "should return nil on account/password mismatch" do
        wrong_password_user = SystemUser.authenticate(@attr[:account], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an account address with no system_user" do
        nonexistent_user = SystemUser.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the system_user on account/password match" do
        matching_user = SystemUser.authenticate(@attr[:account], @attr[:password])
        matching_user.should == @system_user
      end
    end
  end
end

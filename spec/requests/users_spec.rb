require 'spec_helper'

describe "Users" do

  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "user[name]",         :with => ""
          fill_in "user[email]",        :with => ""
          fill_in "user[password]",     :with => ""
          click_button "Create"

          #save_and_open_page
          page.has_selector?('title', 'Sign up')
          page.has_selector?('div.alert-error')
        end.should_not change(User, :count)
      end
    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "user[name]",         :with => "Example User 2"
          fill_in "user[email]",        :with => "user2@example.com"
          fill_in "user[password]",     :with => "foobar2"
          click_button "Create"

          page.has_selector?("div.alert-success")
          #save_and_open_page
          page.has_selector?('title', 'User Example User 2')
        end.should change(User, :count).by(1)
      end
    end

    describe "sign in/out" do

      describe "failure" do
        it "should not sign a user in" do
          visit login_path
          fill_in "session[email]",    :with => ""
          fill_in "session[password]", :with => ""
          click_button "Login"

          page.has_selector?("div.alert-error", :text => "Invalid")
        end
      end

      describe "success" do
        it "should sign a user in and out" do
          user = FactoryGirl.create(:user)
          visit login_path
          fill_in "session[email]",    :with => user.email
          fill_in "session[password]", :with => user.password
          click_button "Login"
          #controller.should be_signed_in
          click_link "Logout"
          #controller.should_not be_signed_in
        end
      end
    end
  end
end

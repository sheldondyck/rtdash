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
          click_button
          response.should render_template('users/new')
          response.should have_selector('div.alert-error')
        end.should_not change(User, :count)
      end
    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "user[name]",         :with => "Example User"
          fill_in "user[email]",        :with => "user@example.com"
          fill_in "user[password]",     :with => "foobar"
          click_button
          response.should have_selector("div.alert-success")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end

    describe "sign in/out" do

      describe "failure" do
        it "should not sign a user in" do
          visit login_path
          fill_in "session[email]",    :with => ""
          fill_in "session[password]", :with => ""
          click_button
          response.should have_selector("div.alert-error", :content => "Invalid")
        end
      end

      describe "success" do
        it "should sign a user in and out" do
          user = Factory(:user)
          visit login_path
          fill_in "session[email]",    :with => user.email
          fill_in "session[password]", :with => user.password
          click_button
          controller.should be_signed_in
          click_link "Logout"
          controller.should_not be_signed_in
        end
      end
    end
  end
end

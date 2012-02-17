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
          response.should have_selector('div.alert-message.error')
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
          response.should have_selector("div.alert-message.success")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
end

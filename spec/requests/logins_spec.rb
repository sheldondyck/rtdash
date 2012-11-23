require 'spec_helper'

describe "Logins" do
  describe "GET /login" do
    it "login should display" do
      visit '/login'
      page.has_selector?('title', "Sign Up")
    end
  end
end

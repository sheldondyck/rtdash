require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    visit '/'
    page.has_selector?('title', "Real Time Dashboard | Home")
  end

  #it "should have a stylesheet page at '/assets/application.css'" do
  #  visit '/assets/application.css'
  #  page.has_selector?('title', "Home")
  #end

  it "should have a Product page at '/features'" do
    visit '/features'
    page.has_selector?('title', "Features")
  end

  it "should have a 'How does it work page' at '/how_does_it_work'" do
    visit '/how_does_it_work'
    page.has_selector?('title', "How does it work?")
  end

  it "should have a Price page at '/price'" do
    visit '/price'
    page.has_selector?('title', "Price")
  end

  it "should have a Blog page at '/blog'" do
    visit '/blog'
    page.has_selector?('title', "Blog")
  end

  it "should have a Support page at '/support'" do
    visit '/support'
    page.has_selector?('title', "Support")
  end

  it "should have a Press page at '/press'" do
    visit '/press'
    page.has_selector?('title', "Press")
  end

  it "should have a Company page at '/company'" do
    visit '/company'
    page.has_selector?('title', "Company")
  end

  it "should have a Signup page at '/signup'" do
    visit '/signup'
    page.has_selector?('title', "Sign Up")
  end

  it "should have a login page at '/login'" do
    visit '/login'
    page.has_selector?('title', "Login")
  end

  it "should have a logout page at '/logout'" do
    visit '/logout'
    page.has_selector?('title', "Logout")
  end
end

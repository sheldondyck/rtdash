require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should be_success
    response.body.should have_selector('title', :text => "Home")
  end

  #it "should have a stylesheet page at '/assets/application.css'" do
  #  get '/assets/application.css'
  #  response.body.should have_selector('title', :text => "Home")
  #end

  it "should have a Product page at '/features'" do
    get '/features'
    response.body.should have_selector('title', :text => "Features")
  end

  it "should have a 'How does it work page' at '/how_does_it_work'" do
    get '/how_does_it_work'
    response.body.should have_selector('title', :text => "How does it work?")
  end

  it "should have a Price page at '/price'" do
    get '/price'
    response.body.should have_selector('title', :text => "Price")
  end

  it "should have a Blog page at '/blog'" do
    get '/blog'
    response.body.should have_selector('title', :text => "Blog")
  end

  it "should have a Support page at '/support'" do
    get '/support'
    response.body.should have_selector('title', :text => "Support")
  end

  it "should have a Press page at '/press'" do
    get '/press'
    response.body.should have_selector('title', :text => "Press")
  end

  it "should have a Company page at '/company'" do
    get '/company'
    response.body.should have_selector('title', :text => "Company")
  end

  it "should have a Signup page at '/signup'" do
    get '/signup'
    response.body.should have_selector('title', :text => "Sign Up")
  end

  it "should have a login page at '/login'" do
    get '/login'
    response.body.should have_selector('title', :text => "Login")
  end

  #it "should have a logout page at '/logout'" do
    #get '/logout'
    #response.body.should have_selector('title', :text => "Logout")
  #end
end

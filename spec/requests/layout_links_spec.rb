require 'spec_helper'

describe "LayoutLinks" do

	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end

	it "should have a Product page at '/features'" do
		get '/features'
		response.should have_selector('title', :content => "Features")
	end

	it "should have a Product page at '/how_does_it_work'" do
		get '/how_does_it_work'
		response.should have_selector('title', :content => "How does it work?")
	end

	it "should have a Price page at '/price'" do
		get '/price'
		response.should have_selector('title', :content => "Price")
	end

	it "should have a Blog page at '/blog'" do
		get '/blog'
		response.should have_selector('title', :content => "Blog")
	end

	it "should have a Blog page at '/support'" do
		get '/support'
		response.should have_selector('title', :content => "Support")
	end

	it "should have a Press page at '/press'" do
		get '/press'
		response.should have_selector('title', :content => "Press")
	end

	it "should have a Product page at '/Company'" do
		get '/company'
		response.should have_selector('title', :content => "Company")
	end

	it "should have a Signup page at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content => "Sign Up")
	end
end

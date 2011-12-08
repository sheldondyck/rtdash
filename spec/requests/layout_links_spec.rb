require 'spec_helper'

describe "LayoutLinks" do

	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end

	it "should have a Product page at '/product'" do
		get '/product'
		response.should have_selector('title', :content => "Product")
	end

	it "should have a Price page at '/price'" do
		get '/price'
		response.should have_selector('title', :content => "Price")
	end

	it "should have a Blog page at '/blog'" do
		get '/blog'
		response.should have_selector('title', :content => "Blog")
	end

	it "should have a Press page at '/press'" do
		get '/press'
		response.should have_selector('title', :content => "Press")
	end

	it "should have a Product page at '/Company'" do
		get '/company'
		response.should have_selector('title', :content => "Company")
	end
end

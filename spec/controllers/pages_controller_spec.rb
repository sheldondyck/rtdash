require 'spec_helper'

describe PagesController do
	render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

		it "should have the right title" do
			get 'home'
			response.should have_selector("title",
                    :content => "Real Time Dashboard | Home")
			end
  end

  describe "GET 'product'" do
    it "should be successful" do
      get 'product'
      response.should be_success
    end

		it "should have the right title" do
			get 'product'
			response.should have_selector("title",
                    :content => "Real Time Dashboard | Product")
			end
  end

  describe "GET 'price'" do
    it "should be successful" do
      get 'price'
      response.should be_success
    end

		it "should have the right title" do
			get 'price'
			response.should have_selector("title",
                    :content => "Real Time Dashboard | Price")
			end
  end

  describe "GET 'blog'" do
    it "should be successful" do
      get 'blog'
      response.should be_success
    end

		it "should have the right title" do
			get 'blog'
			response.should have_selector("title",
                    :content => "Real Time Dashboard | Blog")
			end
  end

  describe "GET 'press'" do
    it "should be successful" do
      get 'press'
      response.should be_success
    end

		it "should have the right title" do
			get 'press'
			response.should have_selector("title",
                    :content => "Real Time Dashboard | Press")
			end
  end

  describe "GET 'company'" do
    it "should be successful" do
      get 'company'
      response.should be_success
    end

		it "should have the right title" do
			get 'company'
			response.should have_selector("title",
                    :content => "Real Time Dashboard | Company")
			end
  end
end

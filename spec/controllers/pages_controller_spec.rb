require 'spec_helper'

describe PagesController do
	render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'product'" do
    it "should be successful" do
      get 'product'
      response.should be_success
    end
  end

  describe "GET 'price'" do
    it "should be successful" do
      get 'price'
      response.should be_success
    end
  end

  describe "GET 'blog'" do
    it "should be successful" do
      get 'blog'
      response.should be_success
    end
  end

  describe "GET 'press'" do
    it "should be successful" do
      get 'press'
      response.should be_success
    end
  end

  describe "GET 'company'" do
    it "should be successful" do
      get 'company'
      response.should be_success
    end
  end
end

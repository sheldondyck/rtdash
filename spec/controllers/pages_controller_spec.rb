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
      response.body.should have_title("Real Time Dashboard | Home")
      end
  end

  describe "GET 'features'" do
    it "should be successful" do
      get 'features'
      response.should be_success
    end

    it "should have the right title" do
      get 'features'
      response.body.should have_title("Real Time Dashboard | Features")
      end
  end

  describe "GET 'how_does_it_work'" do
    it "should be successful" do
      get 'how_does_it_work'
      response.should be_success
    end

    it "should have the right title" do
      get 'how_does_it_work'
      response.body.should have_title("Real Time Dashboard | How does it work?")
      end
  end

  describe "GET 'price'" do
    it "should be successful" do
      get 'price'
      response.should be_success
    end

    it "should have the right title" do
      get 'price'
      response.body.should have_title("Real Time Dashboard | Price")
      end
  end

  describe "GET 'support'" do
    it "should be successful" do
      get 'support'
      response.should be_success
    end

    it "should have the right title" do
      get 'support'
      response.body.should have_title("Real Time Dashboard | Support")
      end
  end

  describe "GET 'press'" do
    it "should be successful" do
      get 'press'
      response.should be_success
    end

    it "should have the right title" do
      get 'press'
      response.body.should have_title("Real Time Dashboard | Press")
      end
  end

  describe "GET 'company'" do
    it "should be successful" do
      get 'company'
      response.should be_success
    end

    it "should have the right title" do
      get 'company'
      response.body.should have_title("Real Time Dashboard | Company")
      end
  end
end

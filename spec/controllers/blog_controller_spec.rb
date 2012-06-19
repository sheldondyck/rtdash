require 'spec_helper'

describe BlogController do
  render_views

  before(:each) do
    @attr = {:title => "Blog Title",
      :message => "Blog message.",
      :instance => '2012-01-01T00:00:00',
      :url => 'blog_url'}
    @sys_user = FactoryGirl.create(:system_user)

    30.times do |n|
      @sys_user.blogs.create! @attr.merge(:title => "Blog Title #{n + 1}")
    end

    @blog = @sys_user.blogs.first
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title",
                    :content => "Real Time Dashboard | Blog")
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @blog
      response.should be_success
    end

    it "should have the right title" do
      get :show, :id => @blog
      response.should have_selector("title",
                    :content => "Real Time Dashboard | Blog - Blog Title")
    end

    it "should have the right blog title" do
      get :show, :id => @blog
      response.should have_selector("h2",
                    :content => @blog.title)
    end

    it "should have the right blog content" do
      get :show, :id => @blog
      response.should have_selector("p",
                    :content => @blog.message)
    end
  end

  describe "GET 'previous'" do
    it "should be successful" do
      get :previous, :offset => 10
      response.should be_success
    end

    it "should be successful" do
      get :previous, :offset => 10
      response.should have_selector("h2",
                    :content => "Blog Title 20")
    end

    it "should be successful" do
      get :previous, :offset => 20
      response.should have_selector("h2",
                    :content => "Blog Title 10")
    end

    it "should be successful" do
      get :previous, :offset => 30
      response.should have_selector("h2",
                    :content => "Blog Title 1")
    end
  end

  describe "GET 'next'" do
    it "should be successful" do
      get :next, :offset => 10
      response.should be_success
    end

    it "should be successful" do
      get :next, :offset => 30
      response.should have_selector("h2",
                    :content => "Blog Title 20")
    end
  end
end

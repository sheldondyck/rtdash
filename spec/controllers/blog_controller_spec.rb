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
      @sys_user.blogs.create! @attr.merge(:title => "Blog Title #{n + 1}",
                                          :instance => "2012-01-#{n+1}T00:00:00",
                                          :url => "blog_url_#{n + 1}")
    end

    @blog = @sys_user.blogs.first
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      visit blog_path
      #save_and_open_page
      page.should have_title('Real Time Dashboard | Blog')
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @blog
      response.should be_success
    end

    it "should have the right title" do
      get :show, :id => @blog
      response.body.should have_title("Real Time Dashboard | Blog - Blog Title 1")
    end

    it "should have the right blog title" do
      get :show, :id => @blog
      response.body.should have_selector("h2",
                    :text => @blog.title)
    end

    it "should have the right blog content" do
      get :show, :id => @blog
      response.body.should have_selector("p",
                    :text => @blog.message)
    end

    it "should have the right previous content" do
      get :show, :id => @blog
      @blog_last = Blog.last
      response.body.should have_selector("li",
                    :text => @blog_last.title)
    end

    it "previous content should not have current post" do
      @blog_last = Blog.last
      get :show, :id => @blog_last.id
      response.body.should_not have_selector("li",
                    :text => @blog_last.title)
    end
  end

  describe "GET 'show_by_url'" do
    it "should be successful" do
      get :show_by_url, :year => 2012, :month => 1, :day => 1, :url => 'blog_url_1'
      response.should be_success
    end

    it "should have the right title" do
      get :show_by_url, :year => 2012, :month => 1, :day => 2, :url => 'blog_url_2'
      response.body.should have_title("Real Time Dashboard | Blog - Blog Title 2")
    end
  end

  describe "GET 'previous'" do
    it "should be successful" do
      get :previous, :offset => 10
      response.should be_success
    end

    it "should be successful" do
      get :previous, :offset => 10
      response.body.should have_selector("h2",
                    :text => "Blog Title 20")
    end

    it "should be successful" do
      get :previous, :offset => 20
      response.body.should have_selector("h2",
                    :text => "Blog Title 10")
    end

    it "should be successful" do
      get :previous, :offset => 30
      response.body.should have_selector("h2",
                    :text => "Blog Title 1")
    end
  end

  describe "GET 'next'" do
    it "should be successful" do
      get :next, :offset => 10
      response.should be_success
    end

    it "should be successful" do
      get :next, :offset => 30
      response.body.should have_selector("h2",
                    :text => "Blog Title 20")
    end
  end
end

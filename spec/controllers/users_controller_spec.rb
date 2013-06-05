require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.body.should have_title("Sign Up")
    end
  end

  describe "POST 'create'" do

    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :email => "", :password => ""}
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @attr
        response.body.should have_title("Sign up")
      end
          
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

      it "should show a alert message" do
        post :create, :user => @attr
        response.body.should have_selector("div.alert-error")
      end
    end

    describe "success" do
    
      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar"}
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
            
      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end    

      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /Created new user/i
      end

      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end

      #it "should have a alert message" do
        #post :create, :user => @attr
        #response.should have_selector("div", :class => "alert-message success")
      #end
    end
  end

  describe "authentication of show page" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    describe "for non-signed-in users" do

      it "should deny access to 'show'" do
        get :show, :id => @user
        response.should redirect_to(login_path)
      end
    end

    describe "for signed-in users" do

      before(:each) do
        wrong_user = FactoryGirl.create(:user, :email => "user@example.net")
        test_sign_in(wrong_user)
      end

      it "should require matching users for 'show'" do
        get :show, :id => @user
        response.should redirect_to(root_path)
      end
    end
  end
end

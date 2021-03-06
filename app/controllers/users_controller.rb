class UsersController < ApplicationController
  before_filter :authenticate,    :only => [:show]
  before_filter :authorize,       :only => [:show]

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Created new user"
      redirect_to @user
    else
      @title = "Sign up"
      flash.now[:error] = "Please fix the problems with the form"
      render 'new'
    end
  end

  def show
    @title = "User " + @user.name
    # TODO: problably very inefficient
    @chat = @user.chats.order(:instant).reverse
  end

  private

    def authorize
     @user = User.find(params[:id])
     redirect_to(root_path) unless current_user?(@user)
    end
end

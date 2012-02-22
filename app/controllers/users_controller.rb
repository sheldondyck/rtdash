class UsersController < ApplicationController

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
			flash.now[:error] = "Please fix the problems with the form"
			@title = "Sign up"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
end

class UsersController < ApplicationController

  def new
		@user = User.new
		@title = "Sign Up"
  end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Created new user"
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
end

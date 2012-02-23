class UsersController < ApplicationController

  def new
		@user = User.new
		@title = "Sign Up"
  end

	def create
		@user = User.new(params[:user])
    #logger.debug "SIGN_IN create #{@user.inspect}"
    #logger.debug "SIGN_IN create #{cookies.inspect}"
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
		@user = User.find(params[:id])
	end
end

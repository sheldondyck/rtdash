class SessionsController < ApplicationController

  def new
    @title = 'Login'
  end

  def create
    logger.debug "DEBUG SessionController create"
    user = User.authenticate(params[:session][:email], 
                             params[:session][:password])

    logger.debug "DEBUG SessionController user #{user.to_yaml}"
    if user.nil?
      flash.now[:error] = "Invalid email or password"
      @title = "Login"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path 
  end
end

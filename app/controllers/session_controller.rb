class SessionController < ApplicationController

	def login

		if params[:user]
			sleep 5
			redirect_to root_path 
		end
	end
end

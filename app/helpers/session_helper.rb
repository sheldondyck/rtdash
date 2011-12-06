module SessionHelper
	
	def sign_in user
	end

	def signed_in?
		return false
	end

	def authenticate
		deny_access unless signed_in?
	end

	def deny_access
		redirect_to login_path, :notice => "Please sign in to access this page."
	end
end


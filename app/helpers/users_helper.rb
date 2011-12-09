module UsersHelper
	def user_error_class(user, sym)
		if user.errors.messages.has_key?(sym)
			"error"
		end
	end

	def user_error_message(user, sym)
		if user.errors.messages.has_key?(sym)
			user.errors.messages[sym][0]
		end
	end
end

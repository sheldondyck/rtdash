module ApplicationHelper
	def title
		base_title = "Real Time Dashboard"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def flash_handler
		flash.each do |key, value|
			"<div class=\"flash #{key}\">#{value}</div>"
		end
	end
end

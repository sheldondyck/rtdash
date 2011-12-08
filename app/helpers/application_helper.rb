module ApplicationHelper
	def title
		base_title = "Real Time Dashboard"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end

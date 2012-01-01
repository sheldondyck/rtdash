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
		div = ""
		flash.each do |key, value|
			div += "<div class='alert-message #{key}'>"
      div += "<div class='container'>"
			div += "#{value}"
      div += "</div></div>"
		end

		div
	end
end

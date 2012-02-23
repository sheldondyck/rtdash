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
      div += "<div class='alert alert-#{key}' data-dismiss='alert'>"
      div += "<div class='container'>"
      div += "#{value}"
      div += "<a style='right: 0px;' class='close' data-dismiss='alert'>&times;</a>"
      div += "</div></div>"
    end
    div
  end
end

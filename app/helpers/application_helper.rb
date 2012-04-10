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
      div += "<strong>#{value}</strong>"
      div += "<a style='right: 0px;' class='close' data-dismiss='alert'>&times;</a>"
      div += "</div></div>"
    end
    div
  end

  def broadcast(channel, &block)
    message = { :channel => channel, :data => capture(&block), :ext => { :auth_token => FAYE_TOKEN } }
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end

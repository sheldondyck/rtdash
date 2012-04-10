class ChatController < ApplicationController

  def message
    @message = params[:chat][:message]

    @user = find_user
    @chat = @user.chat.new(params[:chat])
    @chat.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def find_user
      # TODO: need to add the concept of logged in user for the company that will handle 
      # chat messages. For now we are just using id=1

      return User.find(1)
    end
end

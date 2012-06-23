class ChatController < ApplicationController

  def message
    user_key = params[:chat][:user_key]
    message = params[:chat][:message]

    @user = find_user

    if validate_user_key(user_key) then
      @chat = @user.chats.new(params[:chat])
      @chat.save

      respond_to do |format|
        format.js
      end
    end
  end

  private
    def find_user
      # TODO: need to add the concept of logged in user for the company that will handle 
      # chat messages. For now we are just using id=1

      return User.find(1)
    end

    def validate_user_key(key)
      # TODO: basic security, this value is shared between the site and the rt database
      # TODO: need to seperate company chat streams and user/client chat streams
      key == 'abc1234'
    end
end

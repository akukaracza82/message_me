class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_msg: message_render(message)
      #foo is a hash, that will be received by data arg in coffee file
      #mod_msg had been created as a key for the message arg (from line 6)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end

class ChatroomsController < ApplicationController
  def index
    first_chatroom = current_user.matches.first.chatroom
    redirect_to chatroom_path(first_chatroom)
  end

  def show
    @matches = current_user.matches
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end

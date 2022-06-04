class ChatroomsController < ApplicationController
  def show
    @matches = current_user.matches
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end

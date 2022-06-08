class ChatroomsController < ApplicationController
  def index
    @matches = current_user.matches
    if @matches.empty?
      redirect_to(apartments_path, notice: "You don't have any matches yet!")
    else
      first_chatroom = current_user.matches.first.chatroom
      redirect_to chatroom_path(first_chatroom)
    end
  end

  def show
    @matches = current_user.matches
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end

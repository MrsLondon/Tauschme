class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    # binding.pry
    if @message.save
      ActionCable.server.broadcast("everyone",
        render_to_string(partial: 'message', locals: {message: @message} ))
        redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render 'chatrooms/show', locals: { matches: @matches = current_user.matches }
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end






# if @message.save
#   roomChannel.broadcast_to(
#     @chatroom,
#     render_to_string(partial: "message", locals: {message: @message})
#   )
#   head :ok
# else

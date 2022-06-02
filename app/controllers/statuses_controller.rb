class StatusesController < ApplicationController

  def create
    if params[:status] == "disliked"
      @status = Status.new
      @status.user1 = current_user
      @status.disliked = true
      if @status.save
        redirect_to apartments_path
      else
        render 'pages/home'
      end
    else
      if Status.exists?(user2: current_user) && Status.exists?(user1: User.find(params[:user]))
        @status = Status.find_by(user2: current_user, user1: User.find(params[:user]))
        # @status.liked = true
        if @status.update(liked: true)
          redirect_to apartments_path
        else
          render 'pages/home'
        end
      else
        @status = Status.new
        @status.user1 = current_user
        @status.user2 = User.find(params[:user])
        if @status.save
          redirect_to apartments_path
        else
          render 'pages/home'
        end
      end
    end
  end

  # private

  # def status_params
  #   params.require(:status).permit(:liked, :disliked, :apartment_id)
  # end
end

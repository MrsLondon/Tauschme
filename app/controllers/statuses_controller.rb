class StatusesController < ApplicationController
  before_action :set_status

  def create
    if params[:status] == "disliked"
      @status.update(disliked: true)
    else
      if @status.liked
        @status.update(matched: true)
      else
        @status.update(liked: true)
      end
    end
    redirect_to apartments_path
  end

  def set_status
    @status = Status.find_by(user1_id: params[:user], user2_id: current_user.id)
    if @status.present?
      @status.update(is_ongoing: false)
    else
      @status = Status.new(user1_id: current_user.id, user2_id: params[:user])
    end
  end
end

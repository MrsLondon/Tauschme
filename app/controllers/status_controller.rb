class StatusController < ApplicationController

  def create
    @status = Status.new(status_params)
    @status.user = current_user
    if @status.save
      redirect_to apartments_path
    end
  end

  private

  def status_params
    params.require(:status).permit(:liked, :disliked, :apartment_id)
  end
end

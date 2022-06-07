class ApartmentsController < ApplicationController
  def index
    if current_user.present?
      @filter = current_user.filter
      return redirect_to(onboarding_path, notice: "You need to add your apartment first") if @filter.nil?
      # filter out current user
      @apartments = Apartment.where.not(user_id: current_user.id)
      @apartments = @apartments.where(area: @filter.area)
      @apartments = @apartments.where(room: @filter.room)
      @apartments = @apartments.where(rent: 0..@filter.rent)
      @apartments = @apartments.reject do |apartment|
        current_user.active_statuses.pluck(:user1_id, :user2_id).flatten.include?(apartment.user_id)
      end
    else
      @apartments = Apartment.all
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def edit
  end

  def new
    @apartment = Apartment.new
  end

  def update
    if @apartment.update(apartment_params)
      redirect_to @apartment, notice: 'Your apartment was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @apartment = Apartment.new(apartment_params)
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit(:title, :description, :room, :area, :rent, photos: [])
  end

end

class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all.reject { |apartment| apartment.user_id == current_user.id }

    # if current_user.present?
    #   @filter = current_user.filter

    #   @apartments = [Apartment.last]

    #   @apartments = Apartment.where(area: @filter.area)
    #   .and(Apartment.where(room: @filter.room))
    #   .and(Apartment.where(rent: @filter.rent))

    # else
    #   @apartments = Apartment.all
    # end
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

class ApartmentsController < ApplicationController
  def index
    if current_user.present?
      @filter = current_user.filter
      # filter based on user preferences
      @apartments = Apartment
        .where(area: @filter.area)
        .and(Apartment.where(room: @filter.room))
        .and(Apartment.where(rent: @filter.rent))
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
    params.require(:apartment).permit(:title, { photo: [] }, :description, :room, :area, :rent)
  end

end

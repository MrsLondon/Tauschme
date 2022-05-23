class OnboardingController < ApplicationController

  def new
    @apartment = Apartment.new
    @filter = Filter.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user

    @filter = Filter.new(filter_params)
    @filter.user = current_user


    if @apartment.save && @filter.save
      redirect_to apartments_path
    else
      render 'new'
    end
  end

  private

  def apartment_params
    params.require(:apartment).permit(:title, { photo: [] }, :description, :room, :area, :rent)
  end

  def filter_params
    params.require(:filter).permit(:room, :area, :rent)
  end
end

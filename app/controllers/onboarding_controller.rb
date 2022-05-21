class OnboardingController < ApplicationController

  def new
    @apartment = Apartment.new
    @filter = Filter.new
  end

  def create
    @apartment = Apartment.new(
      #image: params["apartment"]["area"],
      area: params["apartment"]["area"],
      room: params["apartment"]["room"],
      rent: params["apartment"]["rent"],
      description: params["apartment"]["description"],
      photos: params["apartment"]["photos"]
    )
    @apartment.user = current_user
    @apartment.save

    @filter = Filter.new(
      area: params["filter"]["area"],
      room: params["filter"]["room"],
      rent: params["filter"]["rent"],
    )
    @filter.user = current_user
    @filter.save
  end
end

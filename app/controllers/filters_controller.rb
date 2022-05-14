class FiltersController < ApplicationController

  before_action :set_filter, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @filters.all
  end

  def show
    @filter = Filter.find(params[:id])
  end

  def new
    @filter = Filter.new
  end

  def edit
  end

  def create
    @filter = Filter.new(filter_params)
    @user.user = @current_user
    @filter.user = @user
    if @filter.save
      redirect_to @filter
    else
      render :new
    end
  end

  def update
    if @filter.update(filter_params)
      redirect_to @filter, notice: 'Your criteria was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @filter.destroy
    redirect_to apartment_path
  end

  private

  def filter_params
    params.require(:filter).permit(:size, :description, :room, :address, :rent)
  end

  def set_filter
    @filter = Filter.find(params[:id])
  end
end

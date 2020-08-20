class BoatsController < ApplicationController
  before_action :find_boat, only: [:edit, :update, :show]
  skip_before_action :authenticate_user!, only: [:index]

  def index

    @boats = Boat.geocoded # returns flats with coordinates

    if params[:query].present?
      @boats = @boats.search_by_title_and_description(params[:query])
    end
    if params[:category].present?
      @boats = @boats.where(category: params[:category])
    end
    if params[:price_max].present?
      @boats = @boats.where("price <= ?", params[:price_max])
    end

    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
      }
    end
  end

  def index2
    @boats = Boat.all

    if params[:query].present?
      @boats = @boats.search_by_title_and_description(params[:query])
    end
    if params[:category].present?
      @boats = @boats.where(category: params[:category])
    end
    if params[:price_max].present?
      @boats = @boats.where("price <= ?", params[:price_max])
    end


    @boats = Boat.geocoded # returns flats with coordinates

    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat })
      }
    end
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boats_path
    else
      render :new
    end
  end

  def edit
  end

  def show
   # returns flats with coordinates

   @booking = Booking.new

    @marker = [{
      lat: @boat.latitude,
      lng: @boat.longitude
    }]
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:title, :description, :category, :price, :photo, :address)
  end

  def find_boat
    @boat = Boat.find(params[:id])
  end
end

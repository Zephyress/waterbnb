class BookingsController < ApplicationController
  def find_id
    @boat = Boat.find(params[:boat_id])
  end

  def new
    find_id
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    find_id
    @booking.boat = @boat
    @booking.user = current_user
    if @booking.save!
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

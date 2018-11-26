class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  def index
    @bookings = Booking.
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :room_id, :start_time, :end_time, :status)
  end
end

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  def index
    @all_bookings = Booking.all
    @myrooms = Room.where(params[current_user.id])
    @my_hostings = []
    @myrooms.each do |room|
      room.bookings.each do |booking|
        @my_hostings << booking
      end
    end
    @my_bookings = Booking.where(params[current_user.id])
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

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  def index
    @all_bookings = Booking.all
    @myrooms = Room.where(user_id: current_user.id)
    @my_hostings = []
    @myrooms.each do |room|
      room.bookings.each do |booking|
        @my_hostings << booking
      end
    end
    @my_bookings = Booking.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @booking = Booking.new
    @room = Room.find(params[:room_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    @booking.status = 'Pending'
    @booking.user = current_user
    @booking.room = @room
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
    params.require(:booking).permit(:start_time, :end_time, :status)
  end
end

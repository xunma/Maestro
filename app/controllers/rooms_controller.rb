class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update, :destroy, :bookings]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      params[:room][:image].each do |i|
        @room.room_images.create(image: i)
      end
      redirect_to room_path(@room), notice: 'Room successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @room.update(room_params)
  end

  def destroy
    @room.destroy
  end

  def myrooms
    @myrooms = Room.where(user_id: current_user.id)
  end

  def search
    @rooms = Room.where(room_params)
  end

  def bookings
    @bookings = Booking.where(@room)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:instrument_type, :description, :location, :price, room_images_attributes: [:id, :room_id, :image])
  end
end

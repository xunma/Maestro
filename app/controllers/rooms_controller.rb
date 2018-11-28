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
    if @room.save
      if params[:room][:image]
        params[:room][:image].each do |i|
          @room.room_images.create(image: i)
        end
      end
      redirect_to room_path(@room), notice: 'Room successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @room.destroy
  end

  def myrooms
    @myrooms = Room.where(user_id: current_user.id)
  end

  def search
    @rooms = []
    Room.where(instrument_type: room_params[:instrument_type]).each do |room|
      @rooms << room
    end
    Room.where(location: room_params[:location]).each do |room|
      @rooms << room
    end
    @map_rooms = []
    @rooms.each do |room|
      @map_rooms << room if room.latitude != nil && room.longitude != nil
    end

    @markers = @map_rooms.map do |room|
      {
        lng: room.longitude,
        lat: room.latitude,
        infoWindow: { content: render_to_string(partial: "/rooms/map_window", locals: { room: room }) }
      }
    end

  end

  def bookings
    @bookings = Booking.where(@room)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:instrument_type, :description, :location, :price, :currency, room_images_attributes: [:id, :room_id, :image])
  end
end

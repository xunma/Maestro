class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update, :destroy, :bookings]

  def index
    if params[:room].nil?
      @rooms = Room.all
    elsif params[:room][:instrument_type] != "" && params[:room][:location] != ""
      sql_query = "instrument_type ILIKE :instrument_type AND location ILIKE :location"
      @rooms = Room.where(sql_query, instrument_type: "#{params[:room][:instrument_type]}", location: "#{params[:room][:location]}")
    elsif params[:room][:instrument_type] != ""
      sql_query = "instrument_type ILIKE :instrument_type"
      @rooms = Room.where(sql_query, instrument_type: "#{params[:room][:instrument_type]}")
    elsif params[:room][:location] != ""
      sql_query = "location ILIKE :location"
      @rooms = Room.where(sql_query, location: "#{params[:room][:location]}")
    end
    @map_rooms = @rooms.where.not(latitude: nil).where.not(longitude: nil)

    @markers = @map_rooms.map do |room|
      {
        lng: room.longitude,
        lat: room.latitude,
        infoWindow: { content: render_to_string(partial: "/rooms/map_window", locals: { room: room }) }
      }
    end
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

  def bookings
    @bookings = Booking.where(@room)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:instrument_type, :description, :location, :price, :address, :currency, room_images_attributes: [:id, :room_id, :image])
  end
end

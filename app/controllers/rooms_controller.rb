class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update, :destroy]

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
    if @room.save
      redirect_to room_path(@room)
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
    @myrooms = Room.search(params[:user_id])
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:email, :instrument_type, :location, :price, :user_id)
  end
end

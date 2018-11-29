class RoomImagesController < ApplicationController

  def destroy
    image = RoomImage.find(params[:id])
    image.destroy
    redirect_to room_path(Room.find(params[:room_id]))
  end
end

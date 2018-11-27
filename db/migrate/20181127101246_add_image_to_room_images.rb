class AddImageToRoomImages < ActiveRecord::Migration[5.2]
  def change
    add_column :room_images, :image, :string
  end
end

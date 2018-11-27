class RoomImage < ApplicationRecord
  mount_uploader :image, PhotoUploader

  validates :image, presence: true
  validates :room_id, presence: true, allow_blank: false
  belongs_to :room

  def article_params
    params.require(:room_image).permit(:image)
  end
end

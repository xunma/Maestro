class RoomImage < ApplicationRecord
  validates :room_images, presence: true
  validates :room_id, presence: true, allow_blank: false
  belongs_to :room
end

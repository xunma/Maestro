class RoomImage < ApplicationRecord
  validates :image, presence: true
  validates :room_id, presence: true, allow_blank: false
  belongs_to :room
end

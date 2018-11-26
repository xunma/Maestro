class Booking < ApplicationRecord
  validates :status, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :room_id, presence: true, allow_blank: false
  belongs_to :user
  belongs_to :room
end

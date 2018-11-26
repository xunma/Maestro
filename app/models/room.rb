class Room < ApplicationRecord
  validates :instrument_type, presence: true
  validates :description, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  has_many :room_images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
end

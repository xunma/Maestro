class Room < ApplicationRecord
  validates :instrument_type, presence: true
  validates :description, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false, inclusion: { in: ['Shanghai', 'Seoul', 'Chengdu', 'Beijing', 'Hong Kong', 'Barcelona'], message: "We aren't in that city yet!" }
  validates :price, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :room_images, dependent: :destroy
  accepts_nested_attributes_for :room_images
  has_many :bookings, dependent: :destroy
  belongs_to :user

  def currency
    if ['Shanghai', 'Chengdu', 'Beijing'].include?(self.location)
      '¥'
    elsif self.location == 'Hong Kong'
      'HK$'
    elsif self.location == 'Seoul'
      '₩'
    else
      '€'
    end
  end
end

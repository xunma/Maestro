class Booking < ApplicationRecord
  validates :status, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :room_id, presence: true, allow_blank: false
  belongs_to :user
  belongs_to :room

  def cost
    ((self.end_time - self.start_time) / 3600).floor * self.room.price
  end

  def color
    if self.status == 'pending'
      '#ff8f56'
    elsif self.status == 'accepted'
      '#20716a'
    else
      '#ff5959'
    end
  end
end

class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end

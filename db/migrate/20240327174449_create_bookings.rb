class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.integer :paid_status, null: false, default: 0
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :number_of_guests, null: false
      t.integer :number_of_rooms, null: false
      t.decimal :total_price, null: false, precision: 20, scale: 2
      t.timestamps
    end
  end
end

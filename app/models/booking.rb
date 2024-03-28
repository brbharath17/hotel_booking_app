# == Schema Information
#
# Table name: bookings
#
#  id               :bigint           not null, primary key
#  check_in         :date             not null
#  check_out        :date             not null
#  number_of_guests :integer          not null
#  number_of_rooms  :integer          not null
#  paid_status      :integer          default("unpaid"), not null
#  status           :integer          default("pending"), not null
#  total_price      :decimal(20, 2)   not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  hotel_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_bookings_on_hotel_id  (hotel_id)
#  index_bookings_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hotel_id => hotels.id)
#  fk_rails_...  (user_id => users.id)
#
class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  enum :status, { pending: 0, confirmed: 1, canceled: 2 }, default: :confirmed
  enum :paid_status, { unpaid: 0, paid: 1, partially_paid: 2 }, default: :paid

  before_save :calculate_total_price

  def calculate_total_price
    self.total_price = hotel.price_per_room * number_of_rooms
  end
end

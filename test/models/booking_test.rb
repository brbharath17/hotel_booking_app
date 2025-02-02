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
require "test_helper"

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

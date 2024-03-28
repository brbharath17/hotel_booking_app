require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#calculate_total_price' do
    let(:hotel) { create(:hotel, price_per_room: 100) }
    let(:user) { create(:user) }
    let(:booking) { create(:booking, hotel: hotel, user: user, number_of_rooms: 2) }

    it 'calculates the total price based on the number of rooms and price per room' do
      expect(booking.total_price).to eq(200)
      booking.update(total_price: 100)
      expect(booking.total_price).to eq(200) # callback should have updated the correct total price
    end
  end
end

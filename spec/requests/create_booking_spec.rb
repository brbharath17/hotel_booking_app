require 'rails_helper'

RSpec.describe BookingsController, type: :request do
  describe 'POST /bookings' do
    let(:user) { create(:user) }
    let(:hotel) { create(:hotel) }
    let(:valid_attributes) { build(:booking, user: user, hotel: hotel).attributes }

    context 'with valid parameters' do
      it 'creates a new booking' do
        post '/bookings', params: valid_attributes

        expect(response).to have_http_status(:ok)
        expect(Booking.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new booking' do
        post '/bookings', params: { booking: { user_id: user.id } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(Booking.count).to eq(0)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']).to_not be_nil
      end
    end
  end

  describe 'PUT /bookings/:id' do
    let(:user) { create(:user) }
    let(:hotel) { create(:hotel) }
    let(:booking) { create(:booking, user: user, hotel: hotel) }
    let(:new_attributes) { { number_of_rooms: 3 } }

    context 'with valid parameters' do
      it 'updates the booking' do
        put "/bookings/#{booking.id}", params: new_attributes

        expect(response).to have_http_status(:ok)
        booking.reload
        expect(booking.number_of_rooms).to eq(3)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the booking' do
        put "/bookings/#{booking.id}", params: { number_of_rooms: nil }

        expect(response).to have_http_status(:internal_server_error)
        booking.reload
        expect(booking.number_of_rooms).to_not be_nil
      end
    end
  end

  describe 'POST /bookings/:id/cancel' do
    let(:user) { create(:user) }
    let(:hotel) { create(:hotel) }
    let(:booking) { create(:booking, user: user, hotel: hotel) }

    it 'cancels the booking' do
      post "/bookings/#{booking.id}/cancel"

      expect(response).to have_http_status(:ok)
      booking.reload
      expect(booking.status).to eq('canceled')
    end
  end
end

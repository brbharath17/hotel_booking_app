require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users/:id/bookings' do
    let(:user) { create(:user) }
    let(:hotel) { create(:hotel) }
    let!(:booking) { create(:booking, user: user, hotel: hotel) }

    it 'returns the user\'s bookings' do
      get "/users/#{user.id}/bookings"

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['status']).to eq('success')
      expect(parsed_response['data'].first['id']).to eq(booking.id)
      expect(parsed_response['data'].size).to eq(1)
    end
  end
end

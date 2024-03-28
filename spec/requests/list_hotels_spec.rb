require 'rails_helper'

RSpec.describe HotelsController, type: :request do
  describe 'GET /hotels' do
    let!(:city) { create(:city) }
    let!(:hotel1) { create(:hotel, city: city) }
    let!(:hotel2) { create(:hotel) }

    it 'returns all hotels' do
      get '/hotels'

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['status']).to eq('success')
      expect(parsed_response['data'].size).to eq(2)
      expect(parsed_response['data'].map{ |b| b['id'] }).to match_array([hotel1.id, hotel2.id])
    end

    context 'with city_id parameter' do
      it 'returns hotels for the given city' do
        get "/hotels?city_id=#{hotel2.city.id}"

        expect(response).to have_http_status(:ok)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['status']).to eq('success')
        expect(parsed_response['data'].size).to eq(1)
        expect(parsed_response['data'].first['id']).to eq(hotel2.id)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'GET api/v1/leagues/find', type: :request do
  before do
    create :league, lat: 1, lng: 3, price: 1000
    create :league, lat: 4, lng: 2, price: 3000
    create :league, lat: -3, lng: -1, price: 2000
    create :league, lat: -5, lng: -7, price: 500 # outside radius
  end

  context 'with valid params' do
    let(:params) do
      {
        search_location: [1, 1],
        radius: 5,
        budget: 4000
      }
    end

    it 'returns leagues within radius and budget' do
      get find_api_v1_leagues_path, params: params
      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body).length).to eq 2
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        search_location: '1, 1',
        budget: 4000
      }
    end

    it 'does not create a league' do
      get find_api_v1_leagues_path, params: params
      expect(response).to have_http_status :unprocessable_entity
      expect(JSON.parse(response.body).keys).to eq ['errors', 'valid_request_example']
    end
  end
end

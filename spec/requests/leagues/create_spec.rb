require 'rails_helper'

RSpec.describe 'POST api/v1/leagues', type: :request do
  context 'with valid params' do
    let(:league_params) do
      {
        league: {
          name: 'Ball is Lyfe',
          lat: 90,
          lng: -180,
          price: 500
        }
      }
    end

    it 'creates a league' do
      expect { post api_v1_leagues_path, params: league_params }.to change { League.count }.by 1
      expect(response).to have_http_status :ok
    end
  end

  context 'with invalid params' do
    let(:invalid_params) do
      {
        league: {
          name: 'Ball is Lyfe',
          lat: 91,
          lng: -181,
          price: 0
        }
      }
    end

    it 'does not create a league' do
      expect { post api_v1_leagues_path, params: invalid_params }.to change { League.count }.by 0
      expect(response).to have_http_status :unprocessable_entity
      expect(response.body).to include 'errors'
    end
  end
end

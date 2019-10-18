require 'rails_helper'

RSpec.describe LeagueFinder do
  subject(:league_finder) { described_class.new(search_location: [1, 1], radius: 5, budget: 8000) }

  let!(:league1) { create :league, lat: 1, lng: 3, price: 4500 }
  let!(:league2) { create :league, lat: 4, lng: 2, price: 6000 }
  let!(:league3) { create :league, lat: -3, lng: -1, price: 1500 }
  let!(:league4) { create :league, lat: 2, lng: 5, price: 3500 }
  let!(:league5) { create :league, lat: -4, lng: 1, price: 2500 }
  let!(:league6) { create :league, lat: -5, lng: -7, price: 500 } # outside radius

  describe '#search' do
    it 'finds as many leagues as possible within the search radius and budget' do
      expect(league_finder.search).to eq [league3, league5, league4]
    end
  end
end

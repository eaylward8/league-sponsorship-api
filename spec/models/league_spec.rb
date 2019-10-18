require 'rails_helper'

RSpec.describe League do
  subject(:league) { build :league }

  it 'has a valid factory' do
    expect(league).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }

    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }

    it do
      is_expected.to validate_numericality_of(:lat)
        .is_greater_than_or_equal_to(-90)
        .is_less_than_or_equal_to(90)
        .with_message('must be a value from -90 to 90')
    end

    it do
      is_expected.to validate_numericality_of(:lng)
        .is_greater_than_or_equal_to(-180)
        .is_less_than_or_equal_to(180)
        .with_message('must be a value from -180 to 180')
    end
  end

  describe '#location' do
    it 'returns an array of [lat, lng]' do
      expect(league.location).to eq [league.lat, league.lng]
    end
  end
end

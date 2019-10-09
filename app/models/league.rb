class League < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :lat, numericality: { greater_than_or_equal_to: -90,
                                  less_than_or_equal_to: 90,
                                  message: 'must be a value from -90 to 90' }
  validates :lng, numericality: { greater_than_or_equal_to: -180,
                                  less_than_or_equal_to: 180,
                                  message: 'must be a value from -180 to 180' }

  def location
    [lat, lng]
  end
end

class LeagueFinder
  attr_reader :search_location, :radius, :budget
  attr_accessor :remaining_budget

  def initialize(search_location:, radius:, budget:)
    @search_location = search_location
    @radius = radius
    @budget = budget
    @remaining_budget = budget
  end

  def search
    League.order(:price).all.each_with_object([]) do |league, arr|
      if within_radius?(league.location) && within_budget?(league.price)
        @remaining_budget -= league.price
        arr << league
      end
    end
  end

  private

  def within_radius?(league_location)
    distance(search_location, league_location) <= radius
  end

  def within_budget?(league_price)
    (remaining_budget - league_price).positive?
  end

  def distance(location1, location2)
    Math.sqrt((location2[0] - location1[0])**2 + (location2[1] - location1[1])**2)
  end
end

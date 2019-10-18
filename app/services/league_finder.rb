class LeagueFinder
  attr_reader :search_location, :radius, :budget
  attr_accessor :remaining_budget

  def initialize(search_location:, radius:, budget:)
    @search_location = search_location.map(&:to_f)
    @radius = radius.to_f
    @budget = budget.to_i
    @remaining_budget = @budget
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
    dist_from_search_location(league_location) <= radius
  end

  def within_budget?(league_price)
    (remaining_budget - league_price).positive?
  end

  def dist_from_search_location(location)
    Math.sqrt((location[0] - search_location[0])**2 + (location[1] - search_location[1])**2)
  end
end

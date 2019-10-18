module Api
  module V1
    class LeaguesController < ApplicationController
      def index
        render json: League.all
      end

      def create
        league = League.new(league_params)
        return render(json: league) if league.save

        render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
      end

      def find
        if finder_params_valid?
          finder = LeagueFinder.new(league_finder_params.to_h.symbolize_keys)
          return render json: finder.search
        end

        render json: { errors: 'Invalid request body', valid_request_example: example_request_body },
               status: :unprocessable_entity
      end

      private

      def league_params
        params.require(:league).permit(:name, :lat, :lng, :price)
      end

      def league_finder_params
        params.permit(:radius, :budget, search_location: [])
      end

      def finder_params_valid?
        return false if league_finder_params[:radius].blank?
        return false if league_finder_params[:budget].blank?
        return false if league_finder_params[:search_location].blank?

        true
      end

      def example_request_body
        {
          search_location: [1, 1],
          radius: 3,
          budget: 5000
        }
      end
    end
  end
end

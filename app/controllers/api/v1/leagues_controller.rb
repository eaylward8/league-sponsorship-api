module Api
  module V1
    class LeaguesController < ApplicationController
      def index
        render json: League.all
      end

      def create
        league = League.new(league_params)

        if league.save
          render json: league
        else
          render json: { errors: league.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def league_params
        params.require(:league).permit(:name, :lat, :lng, :price)
      end
    end
  end
end

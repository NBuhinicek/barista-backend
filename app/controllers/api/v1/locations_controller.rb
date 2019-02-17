module Api
  module V1
    class LocationsController < ApiController
      skip_before_action :authenticate

      def index
        render json: LocationSerializer.new(Location.all, include: [:coffee_shop]).serialized_json
      end
    end
  end
end

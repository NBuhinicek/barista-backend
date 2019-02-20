module Api
  module V1
    class LocationsController < ApiController
      skip_before_action :authenticate

      def index
        render json: LocationSerializer.new(Location.all).serialized_json
      end
    end
  end
end

module Api
  module V1
    class LocationsController < ApiController
      def index
        render json: LocationSerializer.new(Location.all, include: [:coffee_shop]).serialized_json
        # respond_with(Location.all, serializer: LocationSerializer, include: [:coffee_shop])
      end
    end
  end
end

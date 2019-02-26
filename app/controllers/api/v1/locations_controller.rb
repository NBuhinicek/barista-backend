module Api
  module V1
    class LocationsController < ApiController
      def index
        render json: LocationSerializer.new(
          Location.all,
          params: { current_location: params[:location] }
        ).serialized_json
      end
    end
  end
end

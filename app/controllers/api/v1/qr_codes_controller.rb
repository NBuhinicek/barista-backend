module Api
  module V1
    class QrCodesController < ApiController
      skip_before_action :authenticate

      def find_table
        coffee_table = CoffeeTable.find_by(qr_code_hash: params[:hash])

        if coffee_table
          render json: CoffeeTableSerializer.new(
            coffee_table,
            include: [:coffee_shop, 'coffee_shop.location']
          ).serialized_json
        else
          head :not_found
        end
      end
    end
  end
end

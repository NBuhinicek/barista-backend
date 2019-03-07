module Api
  module V1
    class QrCodesController < ApiController
      def find_table
        coffee_table = CoffeeTable.find_by(qr_code_hash: params[:hash])

        if coffee_table
          render json: CoffeeTableSerializer.new(
            coffee_table,
            include: [:coffee_shop]
          ).serialized_json
        else
          head :not_found
        end
      end
    end
  end
end

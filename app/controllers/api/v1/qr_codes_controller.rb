module Api
  module V1
    class QrCodesController < ApiController
      def find_table
        coffee_table = CoffeeTable.find_by(qr_code_hash: params[:hash])

        if coffee_table
          render json: CoffeeTableSerializer.new(
            coffee_table,
            include: [:coffee_shop, 'coffee_shop.location']
          ).serialized_json
        else
          render json: { errors: 'Invalid qr code' }, status: :bad_request
        end
      end
    end
  end
end

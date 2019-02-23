module Api
  module V1
    class UsersController < ApiController
      # TODO prebaci u except ili makni skroz jer svugdje skipamo
      skip_before_action :authenticate, only: [
        :create, :check_email, :resend_confirmation, :reset_password
      ]

      # def index
      #   render json: User.query(params['query'])
      #     .order(:email).includes(:bookings)
      # end

      # def show
      #   authorize(user)
      #
      #   render json: user
      # end

      def create
        user = User.new(user_params)
        user.attributes = {
          role: 'customer',
          password: params[:password]
        }

        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors }, status: :bad_request
        end
      end

      # def update
      #   authorize(user)
      #
      #   if user.update(user_params)
      #     render json: user
      #   else
      #     render json: { errors: user.errors }, status: :bad_request
      #   end
      # end

      # def destroy
      #   authorize(user)
      #
      #   user.destroy
      #   head :no_content
      # end

      def check_email
        email = params[:email]

        if !User.find_by(email: email)
          head :ok
        else
          head :conflict
        end
      end

      def resend_confirmation
        user = User.find_by(email: params[:email])

        if user
          user.send_confirmation_instructions
          head :ok
        else
          head :bad_request
        end
      end

      def reset_password
        user = User.find_by(email: params[:email])

        if user
          user.send_reset_password_instructions
          head :ok
        else
          head :bad_request
        end
      end

      private

      def user
        @user ||= User.find(params[:id])
      end

      def user_params
        params.require(:user)
              .permit(:first_name, :last_name, :email, :password)
      end
    end
  end
end

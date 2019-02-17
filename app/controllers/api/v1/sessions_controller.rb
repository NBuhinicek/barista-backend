module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :authenticate, only: [:create]

      def create
        user = User.find_by(email: session_params[:email])

        if user&.authenticate(session_params[:password])
          render json: Session.new(token: user.token, user: user), status: :created
        else
          render json: { errors: { credentials: ['are invalid'] } }, status: :bad_request
        end
      end

      def destroy
        current_user.regenerate_token
        head :no_content
      end

      private

      def session_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end

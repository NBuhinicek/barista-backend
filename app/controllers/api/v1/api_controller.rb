module Api
  module V1
    class ApiController < ActionController::API
      include JsonApiResponders

      before_action :authenticate
      # rescue_from Pundit::NotAuthorizedError, with: :not_authorized
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      def record_not_found
        render json: { errors: { resource: "doesn't exist" } }, status: :not_found
      end

      def authenticate
        return if current_user

        render json: { errors: { token: 'is invalid' } }, status: :unauthorized
      end

      def not_authorized
        render json: { errors: { resource: 'is forbidden' } }, status: :forbidden
      end

      def param_missing(exc)
        render json: { errors: { exc.param => 'is missing' } }, status: :bad_request
      end

      def current_user
        @current_user ||= User.find_by(token: request.headers['Authorization'])
      end
    end
  end
end

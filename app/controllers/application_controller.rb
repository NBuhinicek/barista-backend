class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # protect_from_forgery
  # include Pundit
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  # end

  # private

  # def keys
  #   [:email, :first_name, :last_name]
  # end

  # def user_not_authorized
  #   flash[:alert] = 'You are not authorized to perform this action.'
  #   redirect_to(request.referer || root_path)
  # end
end

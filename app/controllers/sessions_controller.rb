class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    if user_by_email&.role&.customer?
      flash[:alert] = "Customers can't sign in"
      redirect_back(fallback_location: request.referer)
    else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      allow_sign_in
    end
  end

  def destroy
    super
  end

  private

  def allow_sign_in
    sign_in(resource_name, resource)
    if session[:return_to].present?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  def user_by_email
    User.find_by(email: params[:user][:email])
  end
end

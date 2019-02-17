class ConfirmationsController < Devise::ConfirmationsController
  def new
    super
  end

  def create
    super
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    show_confirmation
  end

  private

  def show_confirmation
    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      respond_no_errors
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity) do
        render :new
      end
    end
  end

  def respond_no_errors
    if resource.role.customer?
      render 'show_customer'
    else
      respond_with_navigational(resource) do
        redirect_to after_confirmation_path_for(resource_name, resource)
      end
    end
  end
end

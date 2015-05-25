class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, only: [:create, :update]

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :name,
        :email,
        :password,
        :password_confirmation,
      )
    end
  end
end

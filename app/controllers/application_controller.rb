class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user=(user)
    @current_user = user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

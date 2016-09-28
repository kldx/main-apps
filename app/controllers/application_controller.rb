class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Authenticable

  protected

  def configure_permitted_parameters
    added_attrs = [:callsign, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def article_params
    params.require(:article).permit(:title, :description, :default_image, :status)
  end
end

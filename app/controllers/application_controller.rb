class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_raven_context
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

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user.id]) # or anything else in session
    Raven.extra_context(params: params.to_hash, url: request.url)
  end
end

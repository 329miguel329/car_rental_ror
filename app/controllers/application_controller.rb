class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Chekc if user is signed_in
  before_action :authenticate_user!, unless: :json_request?

  # Local setting in URL to translate the content with I18n.
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

  def json_request?
    request.format == "application/json"
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [{
        status: '400',
        title: 'Bad Request',
        detail: resource.errors,
        code: '100'
      }]
    }, status: :bad_request
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :blood_type_id, :card_type_id, :identification, :rol, :property_card, :license, :phone, :address)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :blood_type_id, :card_type_id, :identification, :rol, :property_card, :license, :phone, :address)}
    end
end

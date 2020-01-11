class ApplicationController < ActionController::Base

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
end

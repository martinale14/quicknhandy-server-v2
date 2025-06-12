module Localizable
  extend ActiveSupport::Concern

  included do
    around_action :set_locale
  end

  private

  def set_locale(&action)
    locale = locale_from_header
    I18n.with_locale(locale, &action)
  end

  def locale_from_header
    locale = request.env.fetch("HTTP_ACCEPT_LANGUAGE", "").scan(/^[a-z]{2}(?:-[a-zA-Z]{2})?/).first
    permit_locale(locale) || permit_locale(locale&.split("-")&.first)
  end

  def permit_locale(locale)
    locale.presence_in(I18n.config.available_locales_set)
  end
end

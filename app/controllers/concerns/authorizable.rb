module Authorizable
  extend ActiveSupport::Concern

  included do
    prepend_before_action :check_suspention!
    prepend_before_action :validate_active_account!
  end

  class_methods do
    def skip_account_validations(only: nil)
      skip_before_action :check_suspention!, :validate_active_account!, only:
    end
  end

  private

  def check_suspention!
    return unless current_user.suspended_until.present? || current_user.suspended_indefinitely

    render json: {
      code: :suspention,
      error: current_user.suspention_message || t("api.errors.suspended"),
      until: current_user.suspended_until,
      indefinitely: current_user.suspended_indefinitely
    }, status: :unauthorized
  end

  def validate_active_account!
    return if current_user.active?

    render json: {
      error: t("api.errors.user.inactive")
    }, status: :unauthorized
  end
end

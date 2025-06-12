module Recoverable
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :handle_standard_error
    include RecordNotFoundable
  end

  private

  def handle_standard_error(error)
    Rails.logger.error error
    Rails.logger.error error.backtrace.join("\n")
    render json: { error: t("api.errors.internal_server_error") }, status: :internal_server_error
  end
end

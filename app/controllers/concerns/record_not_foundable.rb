module RecordNotFoundable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  private

  def record_not_found
    render json: { error: t("api.errors.record_not_found") }, status: :not_found
  end
end

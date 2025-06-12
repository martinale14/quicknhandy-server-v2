module Authenticable
  extend ActiveSupport::Concern

  included do
    prepend_before_action :authenticate_api_token!
  end

  def update_api_token!
    return if api_token.expired?

    api_token.expires_at = Time.current + 30.days
    api_token.save
  end

  private

  def authenticate_api_token!
    render json: { error: t("api.errors.unauthorized") }, status: :unauthorized unless user_from_token
  end


  def user_from_token
    return unless api_token.present?

    api_token.session.user unless api_token.expired?
  end


  def token_from_header
    request.headers.fetch("Authorization", "").split(" ").last
  end

  def api_token
    return @_api_token if @_api_token
    @_api_token ||= ApiToken.includes(session: :user).find_by(token: token_from_header)
    Current.session = @_api_token&.session
    Current.user = @_api_token&.session&.user
    @_api_token
  end
end

class Api::BaseController < ActionController::API
  include AbstractController::Translation
  include ActionController::Caching
  include CurrentHelper
  include Authorizable
  include Authenticable
  include Localizable
  include TimeZoneable
  include Coverable
  include Recoverable
  include Pagy::Backend
  helper :all

  def self.skip_account_checks(only: nil)
    skip_before_action :authenticate_api_token!, only: only
    skip_account_validations only: only
  end
end

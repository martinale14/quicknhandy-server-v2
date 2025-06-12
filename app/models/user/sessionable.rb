module User::Sessionable
  extend ActiveSupport::Concern

  included do
    has_many :sessions, dependent: :destroy
  end

  # @!method init_api_session(device_params)
  #   @param device_params [ActionController::Parameters] Device parameters
  #   @return [Session]
  def  init_api_session(device_params)
    sessions.create!(
      device_attributes: device_params,
      api_token_attributes: {
        expires_at: Time.current + 30.days
      }
    )
  end
end

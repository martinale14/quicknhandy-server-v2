class Api::V1::SessionsController < Api::V1::BaseController
  skip_account_validations only: [ :create, :destroy ]
  skip_before_action :authenticate_api_token!, only: :create
  before_action :validate_service!, :update_api_token!, only: :checkin

  def create
    begin
      user = User.authenticate!(email: params[:email].to_s, password: params[:password].to_s)
      session = user.init_api_session(device_params)
    rescue User::Authenticable::InvalidUserParams => e
        return render json: { error: e }, status: :unauthorized
    rescue ActiveRecord::RecordInvalid => e
      return render json: { error: e }, status: :unprocessable_entity
    end

    render "show", locals: { user: user, session: session, api_token: nil }
  end

  def checkin
    device = current_session.device

    return render json: { errors: device.errors_sentence }, status: :unprocessable_entity unless device.update(device_params)

    render "show", locals: { user: current_user, api_token: api_token.token }
  end

  def destroy

  end

  private

  def device_params
    params.require(:device).permit(:push_token, :app_version, :vendor_identifier, :app_build_number, :lat, :lon)
  end
end

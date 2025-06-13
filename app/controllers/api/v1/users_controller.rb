class Api::V1::UsersController < Api::V1::BaseController
  skip_account_checks
  before_action :validate_service!

  def create
    @user = User.new(user_params)

    begin
      ActiveRecord::Base.transaction do
        @user.save!
        @session = @user.init_api_session(device_params)
      end
    rescue ActiveRecord::RecordInvalid => e
      return render json: { error: e }, status: :unprocessable_entity
    end

    render(
      "api/v1/sessions/show",
      locals: {
        user: @user,
        session: @session,
        api_token: nil
      },
      status: :created
    )
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :time_zone, :zip_code, :birthday,
                                 :phone_number, :country_code, :profile_picture)
  end

  def device_params
    params.require(:device).permit(:push_token, :app_version, :vendor_identifier, :app_build_number, :lat, :lon)
  end
end

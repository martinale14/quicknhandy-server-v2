class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [ :show, :update, :destroy ]

  def show
  end

  def create
    @user = User.new(user_params)

    return render json: @user.errors, status: :unprocessable_entity unless @user.save

    render "show", status: :created
  end

  def update
    return render json: @user.errors, status: :unprocessable_entity unless @user.update(user_params)

    render "show"
  end

  def destroy
    @user.active = false

    return render json: @user.errors, status: :unprocessable_entity unless @user.save

    head :no_content
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :time_zone, :zip_code, :birthday,
                                 :phone_number, :country_code, :profile_picture)
  end
end

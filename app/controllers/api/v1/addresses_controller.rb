class Api::V1::AddressesController < Api::V1::BaseController
  before_action :set_address, only: [ :show, :update, :destroy ]

  def index
    @addresses = Address.where(user: current_user)
  end

  def show
  end

  def create
    @address = current_user.addresses.build(address_params)

    location = { lat: @address[:lat], lon: @address[:lon] }
    city = validate_direction!(location)
    return if city.nil?

    @address.city = city

    unless @address.save
      return render json: { error: @address.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end

    render "show"
  end

  def update
    @address.assign_attributes(address_params)

    location = { lat: @address[:lat], lon: @address[:lon] }
    city = validate_direction!(location)
    return if city.nil?

    @address.city = city

    unless @address.save
      return render json: { error: @address.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end

    render "show"
  end

  def destroy
    @address.user = nil

    unless @address.save
      return render json: { error: @address.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end

    render json: { result: :ok }
  end

  private

  def set_address
    @address ||= Address.find_by!(id: params[:id], user: current_user)
  end

  def address_params
    params.require(:address).permit(:lat, :lon, :address, :description, :tag)
  end
end

class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    render "show", locals: { user: current_user }
  end

  def update
    return render json: { error: current_user.errors_sentence }, status: :unprocessable_entity unless current_user.update(user_params)

    render "show", locals: { user: current_user }
  end

  def destroy
    current_user.active = false

    return render json: { error: current_user.errors_sentence }, status: :unprocessable_entity unless current_user.save

    render json: { result: :ok }
  end
end


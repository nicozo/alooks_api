class Api::V1::RegistersController < ApplicationController
  skip_before_action :authenticate_user

  def create
    @user = User.new(user_params)

    if @user.save
      render json: register_response
    else
      render json: @user.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def register_response
    {
      user: @user.as_json(only: [:id, :name])
    }
  end
end

class Api::V1::ProfileController < ApplicationController
  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)
      render json: @user, methods: [:avatar_url]
    else
      render json: @user.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :self_introduction,
      :date_of_birth,
      :sex,
      :game_id,
      :avatar
    )
  end
end

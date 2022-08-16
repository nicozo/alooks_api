class Api::V1::ProfileController < ApplicationController
  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)
      render json: login_response
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
      :avatar,
      :platform
    )
  end

  def encode_access_token
    @_access_token ||= @user.encode_access_token
  end

  def access_token
    encode_access_token.token
  end

  def access_token_expiration
    encode_access_token.payload[:exp]
  end

  def access_token_sub
    encode_access_token.payload[:sub]
  end

  def login_response
    {
      token: access_token,
      expires: access_token_expiration,
      user: @user.response_json({ sub: access_token_sub })
    }
  end
end

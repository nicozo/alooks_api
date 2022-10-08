class Api::V1::PasswordResetsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.find_by_email(params[:email])

      if user
        user.deliver_reset_password_instructions!

        head :ok
      else
        render status: :not_found, json: { status: 404, message: "User Not Found" }
      end
  end

  def update
    set_token_user_from_params?

    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password(params[:user][:password])
      head :ok
    else
      render status: :not_acceptable, json: { status: 406, message: "パスワードの更新に失敗しました" }
    end
  end

  private

  def set_token_user_from_params?
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end
end

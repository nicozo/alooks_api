class Api::V1::SessionsController < ApplicationController
  include UserSessionize

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  skip_before_action :authenticate_user
  before_action :delete_session, only: %i[create]
  before_action :sessionize_user, only: %i[refresh destroy]

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user
      set_refresh_token_to_cookie
      render json: login_response
    else
      render json: 'login_failed', status: :not_found
    end
  end

  def destroy
    delete_session if session_user.forget
    if cookies[:refresh_token].nil?
      head(:ok)
    else
      render status: :internal_server_error, json: { status: 500, message: 'Could not delete session' }
    end
  end

  def refresh
    @user = session_user
    # set_refresh_token_to_cookie
    render json: login_response
  end

  private

  def encode_refresh_token
    @_refresh_token ||= @user.encode_refresh_token
  end

  def refresh_token
    encode_refresh_token.token
  end

  def refresh_token_expiration
    Time.zone.at(encode_refresh_token.payload[:exp])
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

  def set_refresh_token_to_cookie
    cookies[:refresh_token] = {
      value: refresh_token,
      expires: refresh_token_expiration,
      secure: Rails.env.production?,
      http_only: true
    }
  end

  def login_response
    {
      token: access_token,
      expires: access_token_expiration,
      user: @user.response_json({ sub: access_token_sub })
    }
  end
end

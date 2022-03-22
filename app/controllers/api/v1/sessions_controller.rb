class Api::V1::SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      render json: user
    else
      render json: 'login_failed', status: :not_found
    end
  end
end

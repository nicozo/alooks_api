class Api::V1::Admin::BaseController < ApplicationController
  before_action :check_admin

  def check_admin
    render status: :unauthorized unless current_user.admin?
  end
end

class Api::V1::Admin::AppliesController < ApplicationController
  def index
    applies = Apply.all.order(id: :desc)

    render json: applies
  end
end

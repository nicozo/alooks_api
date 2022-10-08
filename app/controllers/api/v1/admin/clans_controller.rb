class Api::V1::Admin::ClansController < ApplicationController
  def index
    clans = Clan.all.order(id: :desc)

    render json: clans
  end
end

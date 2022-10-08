class Api::V1::Admin::RoomsController < ApplicationController
  def index
    rooms = Room.all.order(id: :desc)

    render json: rooms.as_json(only: %i[id title recruitment_number application_deadline platform game_mode rank_tier user_id], methods: %i[host])
  end
end

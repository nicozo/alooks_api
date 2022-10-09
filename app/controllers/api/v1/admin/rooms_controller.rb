class Api::V1::Admin::RoomsController < ApplicationController
  before_action :set_room, only: %i[update destroy]

  def index
    rooms = Room.all.order(id: :desc)

    render json: rooms.as_json(methods: %i[host])
  end

  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :bad_request
    end
  end

  def destroy
    @room.destroy!

    render json: @room
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(
      :title,
      :recruitment_number,
      :is_draft,
      :application_deadline,
      :platform,
      :game_mode,
      :rank_tier
    )
  end
end

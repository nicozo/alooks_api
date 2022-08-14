class Api::V1::RoomsController < ApplicationController
  before_action :set_room, only: %i[show]

  def index
    @rooms = Room.all.includes(association_tables).order(created_at: :desc)
    render json: @rooms.as_json(methods: [:host])
  end

  def new; end

  def show
    render json: @room.as_json(methods: [:host])
  end

  def create
    @room = current_user.rooms.build(processed_params)

    if @room.save
      render json: @room
    else
      render json: @room.errors, status: :bad_request
    end
  end

  def edit; end

  def update; end

  def destroy ;end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def association_tables
    %i[user]
  end

  def room_params
    params.require(:room).permit(
      :title,
      :recruitment_number,
      :is_draft,
      :application_deadline,
      :user_id,
      :platform,
      :game_mode,
      :rank_tier
    )
  end

  def processed_params
    attrs = room_params.to_h
    attrs[:application_deadline] = attrs[:application_deadline].minutes.from_now
    attrs
  end
end

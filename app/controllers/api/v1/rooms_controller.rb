class Api::V1::RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  before_action :current_user_profile_completed?, only: %i[create]
  skip_before_action :authenticate_user, only: %i[recent]

  def index
    @rooms = Room.all.includes(association_tables).order(created_at: :desc)

    render json: @rooms.as_json(methods: %i[host])
  end

  def new; end

  def show
    render json: @room.response_json
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

  def destroy; end

  def recent
    @rooms = Room.recent(3).includes(association_tables)

    render json: @rooms.response_json
  end

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
      :platform,
      :game_mode,
      :rank_tier
    )
  end

  def processed_params
    attrs = room_params.to_h
    if attrs[:application_deadline] != nil
      attrs[:application_deadline] = attrs[:application_deadline].minutes.from_now
    end

    attrs
  end

  def current_user_profile_completed?
    current_user.game_id.present? || head(:bad_request)
  end
end

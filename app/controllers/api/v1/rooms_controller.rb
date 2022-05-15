class Api::V1::RoomsController < ApplicationController
  before_action :set_room, only: %i[show]

  def index
    @rooms = Room.all.includes(association_tables).order(created_at: :desc)
    render json: @rooms.as_json(include: association_tables)
  end

  def new; end

  def show
    render json: @room.as_json(include: association_tables)
  end

  def create
    binding.pry
    @room = authenticate_user.rooms.build(room_params)

    if @room
      render json: @room
    else
      render json: @room.errors, status: :bad_request
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def association_tables
    %i[user]
  end

  def room_params
    require(:room).permit(
      :title,
      :current_squad_member,
      :is_draft,
      :application_deadline,
      :user_id,
      :platform,
      :game_mode,
      :rank_tier
    )
  end
end

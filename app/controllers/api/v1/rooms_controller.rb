class Api::V1::RoomsController < ApplicationController
  # before_action :set_room, only: %i[show]

  def index
    @rooms = Room.all.includes(:user).order(created_at: :desc)
    render json: @rooms
  end

  def new; end

  def show
    # render json: @room
  end

  def create
    # @room = Room.new(room_params)

    # if @room.save
    #   render json: @room
    # else
    #   render json: @room.errors, status: :bad_request
    # end
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

  def room_params
    require(:room).permit(
      :title,
      :current_squad_member,
      :is_draft,
      :application_deadline,
      :user_id
    )
  end
end

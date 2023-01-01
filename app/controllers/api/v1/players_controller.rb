class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: %i[show]
  before_action :current_user_profile_completed?, only: %i[create]
  skip_before_action :authenticate_user, only: %i[index show]

  def index
    players = Player.all.includes(association_tables).order(created_at: :desc)

    render json: players.as_json(
      only: %i[id body], methods: %i[host]
    )
  end

  def show
    render json: @player.response_json
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def association_tables
    %i[user]
  end
end

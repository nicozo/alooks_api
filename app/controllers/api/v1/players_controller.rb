class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]
  before_action :current_user_profile_completed?, only: %i[create]
  skip_before_action :authenticate_user, only: %i[index show]

  def index
    players = Player.all.includes(association_tables).order(created_at: :desc)

    render json: players.as_json(
      only: %i[id body user_id],
      methods: %i[host]
    )
  end

  def show
    render json: @player.response_json
  end

  def create
    player = current_user.build_player(player_params)

    if player.save
      render json: player
    else
      render json: player.errors, status: :bad_request
    end
  end

  def edit
    render json: @player
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :bad_request
    end
  end

  def destroy
    @player.destroy!

    render json: @player
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def association_tables
    %i[user]
  end

  def player_params
    params.require(:player).permit(
      :body
    )
  end

  def current_user_profile_completed?
    current_user.profile_completed || head(:bad_request)
  end
end

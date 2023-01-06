class Api::V1::Admin::PlayersController < Api::V1::Admin::BaseController
  before_action :set_player, only: %i[update destroy]

  def index
    players = Player.all.order(id: :desc)

    render json: players
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

  def player_params
    params.require(:player).permit(:body)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end

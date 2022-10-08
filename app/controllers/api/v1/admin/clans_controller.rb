class Api::V1::Admin::ClansController < ApplicationController
  before_action :set_clan, only: %i[update destroy]

  def index
    clans = Clan.all.order(id: :desc)

    render json: clans
  end

  def update
    if @clan.update(clan_params)
      render json: @clan
    else
      render json: @clan.errors, status: :bad_request
    end
  end

  def destroy
    @clan.destroy!

    render json: @clan
  end

  private

  def set_clan
    @clan = Clan.find(params[:id])
  end

  def clan_params
    params.require(:clan).permit(
      :name,
      :concept,
      :joining_process,
      :prohibited_matters
    )
  end
end

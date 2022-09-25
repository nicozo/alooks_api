class Api::V1::ClansController < ApplicationController
  def index
    @clans = Clan.all.includes(association_tables).order(created_at: :desc)

    render json: @clans.as_json(methods: %i[host])
  end

  def show
  end

  def create
    @clan = current_user.clans.build(clan_params)

    if @clan.save
      render json: @clan
    else
      render json: @clan.errors, status: :bad_request
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def association_tables
    %i[user]
  end

  def clan_params
  end
end

class Api::V1::ClansController < ApplicationController
  before_action :set_clan, only: %i[show edit update destroy]

  def index
    @clans = Clan.all.includes(association_tables).order(created_at: :desc)

    render json: @clans.as_json(only: %i[id name concept user_id])
  end

  def show
    render json: @clan.response_json
  end

  def create
    # @clan = current_user.clans.build(clan_params)
    @clan = current_user.build_clan(clan_params)

    if @clan.save
      render json: @clan
    else
      render json: @clan.errors, status: :bad_request
    end
  end

  def edit
    render json: @clan
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

  def my_clan
    @my_clan = current_user.clan

    render json: @my_clan.response_json
  end

  private

  def set_clan
    @clan = Clan.find(params[:id])
  end

  def association_tables
    %i[user]
  end

  def clan_params
    params.require(:clan).permit(
      :name,
      :concept,
      :interview,
      :prohibited_matters,
      :enrollment,
      :enrollment_age,
      :activity_time,
      :snipe,
      :contact_means,
      :platform,
      :age,
      :required_login,
      :required_ranked,
      :required_vc,
      :personality
    )
  end
end

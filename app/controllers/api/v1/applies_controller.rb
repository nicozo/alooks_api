class Api::V1::AppliesController < ApplicationController
  def index
    @applies = Apply.where(host_id: current_user.id).order(created_at: :desc)

    render json: @applies.as_json(methods: [:applicant, :applied_room])
  end

  def create
    @apply = Apply.new(apply_params)
    @apply.host_id = @apply.room.user_id

    if @apply.save
      render json: @apply
    else
      render json: @apply.errors, status: :bad_request
    end
  end

  def destroy
    # @apply = Apply.where(user_id: params[:user_id], room_id: params[:room_id])
    @apply = Apply.record_exist?(apply_params)
    @apply.destroy

    render json: @apply, status: ok
  end

  private

  def apply_params
    params.require(:apply).permit(
      :body,
      :user_id,
      :room_id
    )
  end
end

class Api::V1::AppliesController < ApplicationController
  before_action :set_apply, only: %i[read]

  def index
    @applications = Apply.where(host_id: current_user.id).order(created_at: :desc)

    render json: @applications.as_json(methods: [:applicant, :applied_room])
  end

  def create
    @application = Apply.new(apply_params)
    @application.host_id = @application.room.user_id

    if @application.save
      render json: @application
    else
      render json: @application.errors, status: :bad_request
    end
  end

  def destroy
    # @apply = Apply.where(user_id: params[:user_id], room_id: params[:room_id])
    @application = Apply.record_exist?(apply_params)
    @application.destroy

    render json: @application, status: ok
  end

  def my_applications
    @applications = Apply.where(user_id: current_user.id).order(created_at: :desc)

    render json: @applications
  end

  def read
    @application.is_read = true
    @application.save

    render json: @application
  end

  private

  def apply_params
    params.require(:apply).permit(
      :body,
      :user_id,
      :room_id
    )
  end

  def set_apply
    @application = Apply.find(params[:id])
  end
end

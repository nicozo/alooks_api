class Api::V1::AppliesController < ApplicationController
  before_action :set_apply, only: %i[read destroy]

  def index
    @applications = Apply.where(host_id: current_user.id).order(created_at: :desc)

    render json: @applications.as_json(methods: %i[applicant applied_room])
  end

  def create
    @application = current_user.applies.new(apply_params)
    @application.host_id = @application.room.user_id

    if @application.save
      render json: @application
    else
      render json: @application.errors, status: :bad_request
    end
  end

  def destroy
    @application.destroy

    render json: @application, status: ok
  end

  def my_applications
    @applications = current_user.applies

    render json: @applications
  end

  def read
    @application.is_read = true
    @application.save

    render json: @application.as_json(methods: %i[applicant applied_room])
  end

  private

  def apply_params
    params.require(:apply).permit(
      :body,
      :room_id
    )
  end

  def set_apply
    @application = Apply.find(params[:id])
  end
end

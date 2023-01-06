class Api::V1::Admin::AppliesController < Api::V1::Admin::BaseController
  before_action :set_apply, only: %i[update destroy]

  def index
    applies = Apply.all.order(id: :desc)

    render json: applies
  end

  def update
    if @application.update(apply_params)
      render json: @application
    else
      render json: @application.errors, status: :bad_request
    end
  end

  def destroy
    @application.destroy!

    render json: @application
  end

  private

  def apply_params
    params.require(:apply).permit(:body)
  end

  def set_apply
    @application = Apply.find(params[:id])
  end
end

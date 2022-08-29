class Api::V1::AgreementsController < ApplicationController
  def index
    @agreements = current_user.agreements.order(created_at: :desc)
  end

  def create
    @agreement = current_user.agreements.build(agreement_params)

    if @agreement.save
      render json: @agreement
    else
      render json: @agreement.errors, status: :bad_request
    end

    Apply.find(params[:applicant_id]).destroy
  end

  private

  def agreement_params
    params.require(:agreement).permit(
      :body,
      :applicant_id,
      :room_id
    )
  end
end

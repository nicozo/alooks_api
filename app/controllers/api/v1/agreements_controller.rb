class Api::V1::AgreementsController < ApplicationController
  def index
    agreements = current_user.agreements.order(created_at: :desc)
  end

  def create
    agreement = current_user.agreements.build(agreement_params)

    if agreement.save
      MatchingMailer.announce_application_accepted(agreement).deliver_now
      Apply.find(params[:application_id]).destroy
      room = Room.find(agreement.room_id)
      room.recruitment_number -= 1 unless room.recruitment_number == 0
      room.save!

      render json: agreement
    else
      render_error_message(nil, agreement.errors)
    end
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

class AgreementValidators < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << :already_agreed if Agreement.exists?(room_id: record.room_id, applicant_id: record.applicant_id)
  end
end

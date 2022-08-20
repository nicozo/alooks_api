class ApplyValidators < ActiveModel::Validator
  def validate(record)
    if record.user_id == record.host_id
      record.errors[:base] << :apply_to_my_room
    end
  end
end

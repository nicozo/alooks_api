class ApplyValidators < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << :apply_to_my_room unless record.user_id != record.host_id

    record.errors[:base] << :apply_to_same_room unless !Apply.exists?(user_id: record.user_id, room_id: record.room_id)
  end
end

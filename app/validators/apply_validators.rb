class ApplyValidators < ActiveModel::Validator
  def validate(record)
    if record.user_id == record.host_id
      record.errors.add :host_id, '自分の募集には申請できません'
    end
  end
end

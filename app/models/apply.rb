class Apply < ApplicationRecord
  include ActiveModel::Validations

  validates_with ApplyValidators, on: :create

  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 25 }
  validates :user_id, uniqueness: { scope: :room_id }
  validates :host_id, presence: true

  def applicant
    user.response_json
  end

  def applied_room
    room.response_json
  end
end

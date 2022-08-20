class Apply < ApplicationRecord
  include ActiveModel::Validations

  validates_with ApplyValidators

  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 25 }
  validates :user_id, uniqueness: { scope: :room_id, message: :apply_to_same_room }
  validates :host_id, presence: true

  # scope :record_exist?, ->(params) { where(user_id: params[:user_id], room_id: params[:room_id]) }

  def applicant
    user.response_json
  end

  def applied_room
    room.response_json
  end
end

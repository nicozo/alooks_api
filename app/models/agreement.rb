class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 25 }
  validates :room_id, uniqueness: { scope: :applicant_id }
  validates :applicant_id, presence: true

  def applicant
    user.response_json
  end

  def agreed_room
    room.response_json
  end
end

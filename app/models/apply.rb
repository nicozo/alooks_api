class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 25 }
  validates :user_id, uniqueness: { scope: :room_id }
  validates :host_id, presence: true
end

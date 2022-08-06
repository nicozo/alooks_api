class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 25 }
  validates :user_id, uniqueness: { scope: :room_id }
  validates :host_id, presence: true

  scope :to_host, -> { where(host_id: current_user.id) }
  scope :record_exist?, -> (params) { where(user_id: params[:user_id], room_id: params[:room_id]) }
end

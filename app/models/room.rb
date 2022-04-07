class Room < ApplicationRecord
  belongs_to :user
  belongs_to :platform

  validates :title, presence: true, length: { maximum: 18 }
  validates :current_squad_member, presence: true
end

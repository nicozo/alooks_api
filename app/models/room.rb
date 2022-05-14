class Room < ApplicationRecord
  belongs_to :user
  # belongs_to :platform
  # belongs_to :game_mode
  # belongs_to :rank_tier

  validates :title, presence: true, length: { maximum: 15 }
  validates :recruitment_number, presence: true
end

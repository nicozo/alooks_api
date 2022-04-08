class Room < ApplicationRecord
  belongs_to :user
  belongs_to :platform
  belongs_to :game_mode
  belongs_to :rank_tier

  validates :title, presence: true, length: { maximum: 18 }
  validates :current_squad_member, presence: true
end

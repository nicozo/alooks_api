class Room < ApplicationRecord
  belongs_to :user
  # belongs_to :platform
  # belongs_to :game_mode
  # belongs_to :rank_tier

  validates :title, presence: true, length: { maximum: 15 }
  validates :recruitment_number, presence: true

  enum platform: [
    :PlayStation,
    :Xbox,
    :PC,
    :Switch
  ]

  enum rank_tier: [
    "ルーキー",
    "ブロンズ",
    "シルバー",
    "ゴールド",
    "プラチナ",
    "ダイアモンド",
    "マスター",
    "プレデター"
  ]

  enum game_mode: [
    "カジュアル",
    "ランク",
    "アリーナ",
    "イベント",
  ]
end

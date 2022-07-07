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
    "プレデター",
    "なし（カジュアル）"
  ]

  enum game_mode: [
    "カジュアル",
    "ランク",
    "アリーナ",
    "イベント"
  ]

  private

  def host
    user.response_json
  end
end

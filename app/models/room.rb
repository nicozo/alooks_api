class Room < ApplicationRecord
  has_many :applies, dependent: :destroy
  belongs_to :user
  # belongs_to :platform
  # belongs_to :game_mode
  # belongs_to :rank_tier

  validates :title, presence: true, length: { maximum: 15 }
  validates :recruitment_number, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }


  enum platform: [
    :PlayStation,
    :Xbox,
    :PC
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

  def response_json
    as_json(only: %i[id title recruitment_number application_deadline platform game_mode rank_tier])
  end

  private

  def host
    user.response_json
  end
end

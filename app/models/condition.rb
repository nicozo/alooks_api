# class Condition < ApplicationRecord
#   belongs_to :clan

#   validates :personality, presence: true, length: { maximum: 100 }

#   enum platform: %w[
#     PlayStation
#     Xbox
#     PC
#   ]

#   enum age: %w[
#     制限なし
#     高校生以上
#     成人以上
#   ]

#   enum required_login: %w[
#     制限なし
#     毎日
#     週1〜2日
#     週3〜4日
#     週5〜6日
#   ]

#   enum required_ranked: %w[
#     制限なし
#     ブロンズ以上
#     シルバー以上
#     ゴールド以上
#     プラチナ以上
#     ダイアモンド以上
#     マスター以上
#     プレデター以上
#   ]
# end

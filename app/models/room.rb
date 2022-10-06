class Room < ApplicationRecord
  has_many :applies, dependent: :destroy
  has_many :agreements, dependent: :destroy
  belongs_to :user
  # belongs_to :platform
  # belongs_to :game_mode
  # belongs_to :rank_tier

  validates :title, presence: true, length: { maximum: 15 }
  validates :recruitment_number, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }

  enum platform: %w[
    PlayStation
    Xbox
    PC
  ], _prefix: true

  enum rank_tier: %w[
    rookie
    bronze
    silver
    gold
    platinum
    diamond
    master
    predator
    casual
  ], _prefix: true

  enum game_mode: %w[
    casual
    ranked
    arena
    event
  ], _prefix: true

  scope :recent, -> (count) { order(id: :desc).limit(count) }

  def response_json
    as_json(
      only: %i[
        id
        title
        recruitment_number
        application_deadline
        platform
        game_mode
        rank_tier
        user_id
      ],
      methods: %i[host]
    )
  end

  private

  def host
    user.response_json
  end
end

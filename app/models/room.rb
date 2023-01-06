class Room < ApplicationRecord
  has_many :applies, dependent: :destroy
  has_many :agreements, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { maximum: 15 }
  validates :recruitment_number, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }

  enum platform: {
    "PlayStation" => 0,
    "Xbox" => 1,
    "PC" => 2
  }, _prefix: true

  enum rank_tier: {
    "rookie" => 0,
    "bronze" => 1,
    "silver" => 2,
    "gold" => 3,
    "platinum" => 4,
    "diamond" => 5,
    "master" => 6,
    "predator" => 7,
    "casual" => 8
  }, _prefix: true

  enum game_mode: {
    "casual" => 0,
    "ranked" => 1,
    "arena" => 2,
    "event" => 3
  }, _prefix: true

  scope :recent, ->(count) { order(id: :desc).limit(count) }

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

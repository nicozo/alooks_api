class Clan < ApplicationRecord
  # has_one :condition
  # has_one :information
  belongs_to :user

  validates :name, presence: true, length: { maximum: 15 }
  validates :concept, presence: true, length: { maximum: 100 }
  validates :joining_process, presence: true, length: { maximum: 100 }
  validates :prohibited_matters, presence: true, length: { maximum: 100 }
  validates :personality, presence: true, length: { maximum: 50 }
  validates :enrollment, presence: true, length: { maximum: 50 }
  validates :activity_time, presence: true, length: { maximum: 50 }
  validates :enrollment_age, presence: true, length: { maximum: 50 }
  validates :snipe, presence: true, length: { maximum: 100 }
  validates :contact_means, presence: true, length: { maximum: 50 }

  enum platform: {
    "unlimited" => 0,
    "PlayStation" => 1,
    "Xbox" => 2,
    "PC" => 3
  }, _prefix: true

  enum age: {
    "unlimited" => 0,
    "high_school_student" => 1,
    "adult" => 2
  }, _prefix: true

  enum required_login: {
    "unlimited" => 0,
    "everyday" => 1,
    "a_couple_of_times_a_week" => 2,
    "three_or_four_times_a_week" => 3
  } ,_prefix: true

  enum required_ranked: {
    "unlimited" => 0,
    "bronze" => 1,
    "silver" => 2,
    "gold" => 3,
    "platinum" => 4,
    "diamond" => 5,
    "master" => 6,
    "predator" => 7
  }, _prefix: true

  def response_json
    as_json(
      only: %i[
        id
        name
        concept
        joining_process
        prohibited_matters
        user_id
      ],
      methods: %i[
        host
        requirements
        information
      ]
    )
  end

  private

  def host
    user.response_json
  end

  def requirements
    as_json(
      only: %i[
        platform
        age
        required_login
        required_ranked
        required_vc
        personality
      ]
    )
  end

  def information
    as_json(
      only: %i[
        enrollment
        enrollment_age
        activity_time
        snipe
        contact_means
      ]
    )
  end
end

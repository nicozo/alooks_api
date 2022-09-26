class Clan < ApplicationRecord
  # has_one :condition
  # has_one :information
  belongs_to :user

  validates :name, presence: true, length: { maximum: 15 }
  validates :concept, presence: true, length: { maximum: 100 }
  validates :interview, presence: true, length: { maximum: 100 }
  validates :prohibited_matters, presence: true, length: { maximum: 100 }
  validates :personality, presence: true, length: { maximum: 100 }
  validates :enrollment, presence: true, length: { maximum: 25 }
  validates :activity_time, presence: true, length: { maximum: 25 }
  validates :enrollment_age, presence: true, length: {  maximum: 25}
  validates :snipe, presence: true, length: { maximum: 35 }
  validates :contact_means, presence: true, length: { maximum: 25 }

  enum platform: %w[
    unlimited
    PlayStation
    Xbox
    PC
  ], _prefix: true

  enum age: %w[
    unlimited
    high_school_student
    adult
  ], _prefix: true

  enum required_login: %w[
    unlimited
    everyday
    a_couple_of_times_a_week
    three_or_four_times_a_week
  ], _prefix: true

  enum required_ranked: %w[
    unlimited
    bronze
    silver
    gold
    platinum
    diamond
    master
    predator
  ], _prefix: true
  
  def response_json
    as_json(
      only: %i[
        id
        name
        concept
        interview
        prohibited_matters
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

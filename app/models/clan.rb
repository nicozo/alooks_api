class Clan < ApplicationRecord
  has_one :condition
  has_one :information
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
    PlayStation
    Xbox
    PC
  ]

  enum age: %w[
    unlimited
    high_school_student
    adult
  ]

  enum required_login: %w[
    unlimited
    everyday
    a_couple_of_times_a_week
    three_or_four_times_a_week
    five_or_six_times_a_week
  ]

  enum required_ranked: %w[
    unlimited
    bronze
    silver
    gold
    platinum
    diamond
    master
    predator
  ]
end

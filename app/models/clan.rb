class Clan < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 15 }
  validates :concept, presence: true, length: { maximum: 100 }
  validates :interview, presence: true, length: { maximum: 100 }
  validates :prohibited_matters, presence: true, length: { maximum: 100 }
end

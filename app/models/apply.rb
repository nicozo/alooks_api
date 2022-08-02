class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { maximum: 25 }
end

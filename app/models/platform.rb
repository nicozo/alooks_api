class Platform < ApplicationRecord
  has_many :rooms, dependent: :destroy
end

class Player < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { maximum: 100 }

  def response_json
    as_json(
      only: %i[
        id
        body
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

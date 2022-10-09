FactoryBot.define do
  factory :apply do
    sequence(:body) { |n| "test#{n}" }
    host_id { room.user_id }
    user
    room
  end
end

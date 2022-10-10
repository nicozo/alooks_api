FactoryBot.define do
  factory :agreement do
    sequence(:body) { |n| "test#{n}" }
    applicant_id { create(:apply).user_id }
    user
    room
  end
end

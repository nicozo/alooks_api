FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }

    trait :admin do
      role { admin }
    end

    trait :profile_completed_user do
      game_id { 'test_game_id' }
    end
  end
end

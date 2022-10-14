FactoryBot.define do
  factory :clan do
    sequence(:name) { |n| "test#{n}" }
    sequence(:concept) { |n| "test concept#{n}" }
    sequence(:joining_process) { |n| "test joining process#{n}" }
    sequence(:prohibited_matters) { |n| "test prohibited matters#{n}" }
    sequence(:personality) { |n| "test personality#{n}" }
    sequence(:enrollment) { |n| "test enrollment#{n}" }
    sequence(:activity_time) { |n| "test activity time#{n}" }
    sequence(:enrollment_age) { |n| "test enrollment age#{n}" }
    sequence(:snipe) { |n| "test snipe#{n}" }
    sequence(:contact_means) { |n| "test contact_means#{n}" }
    platform { Clan.platforms.keys.first }
    age { Clan.ages.keys.first }
    required_login { Clan.required_logins.keys.first }
    required_ranked { Clan.required_rankeds.keys.first }
    required_vc { true }
    user
  end
end

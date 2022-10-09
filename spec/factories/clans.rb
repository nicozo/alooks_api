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
    platform { Clan.platforms.values.first }
    age { Clan.ages.values.first }
    required_login { Clan.required_logins.values.first }
    required_ranked { Clan.required_rankeds.values.first }
    required_vc { true }
    user
  end
end

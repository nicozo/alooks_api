FactoryBot.define do
  factory :condition do
    platform { 1 }
    age { 1 }
    required_login { 1 }
    required_ranked { 1 }
    required_vc { false }
    personality { "MyString" }
    clan { nil }
  end
end

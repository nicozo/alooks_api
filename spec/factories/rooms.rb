FactoryBot.define do
  factory :room do
    title { "MyString" }
    current_squad_member { 1 }
    is_draft { false }
    application_deadline { "2022-04-05 09:39:35" }
  end
end

FactoryBot.define do
  factory :room do
    user
    sequence(:title) { |n| "title#{n}"}
    recruitment_number { rand(1..2) }
    is_draft { false }
    application_deadline { 60.minutes.from_now }
    platform { Room.platforms.values.first }
    game_mode { Room.game_modes.values.first }
    rank_tier { Room.rank_tiers.values.first }
  end
end

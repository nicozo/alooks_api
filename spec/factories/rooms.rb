FactoryBot.define do
  factory :room do
    user
    sequence(:title) { |n| "title#{n}"}
    recruitment_number { rand(1..2) }
    is_draft { false }
    application_deadline { 60.minutes.from_now }
    platform { Room.platforms.keys.first }
    game_mode { Room.game_modes.keys.first }
    rank_tier { Room.rank_tiers.keys.first }
  end
end

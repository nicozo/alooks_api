# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  user = User.create!(
    email: Faker::Internet.unique.safe_email,
    password: 'password',
    password_confirmation: 'password',
    name: Faker::Name.unique.name,
    self_introduction: "自己紹介#{n + 1}",
    sex: rand(2)
  )
end

platform_name = [
  "PlayStation",
  "Xbox",
  "PC",
  "Switch"
]
platform_name.length.times do |n|
  Platform.create!(name: platform_name[n])
end

game_mode_name = [
  "ランク",
  "カジュアル",
  "アリーナ",
  "コントロール"
]
game_mode_name.length.times do |n|
  GameMode.create!(name: game_mode_name[n])
end

rank_tier_name = [
  "ブロンズ",
  "シルバー",
  "ゴールド",
  "プラチナ",
  "ダイアモンド",
  "マスター",
  "プレデター"
]
rank_tier_name.length.times do |n|
  RankTier.create!(name: rank_tier_name[n])
end

10.times do |n|
  room = Room.create!(
    title: "Apex部屋#{n + 1}",
    current_squad_member: rand(1..2),
    application_deadline: rand(1..2).hour.from_now,
    user: User.offset(rand(User.count)).first,
    platform: Platform.offset(rand(Platform.count)).first,
    game_mode: GameMode.offset(rand(GameMode.count)).first,
    rank_tier: RankTier.offset(rand(RankTier.count)).first
  )
end

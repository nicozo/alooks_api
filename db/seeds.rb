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

10.times do |n|
  room = Room.create!(
    title: "Apex部屋#{n + 1}",
    current_squad_member: rand(1..2),
    application_deadline: rand(1..2).hour.from_now,
    user_id: User.find(n + 1).id,
  )
end

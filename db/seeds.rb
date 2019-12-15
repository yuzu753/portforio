# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: '筒香',
  email: 'test@test.com',
  password: 'testtest',
  self_introduction: 'メジャーリーグ目指してます',
)

Recruitment.create!(
  user_id: 1,
  category: 2,
  title: 'テスト',
  body: 'sumple',
  area: 16,
  address: '東京都渋谷区神宮2-12-22',
  recruitments_number: 3,
)

Recruitment.create!(
  user_id: 1,
  category: 3,
  title: 'ゲリットコール',
  body: '悪の帝国復活',
  area: 16,
  address: '東京都渋谷区神宮2-12-22',
  recruitments_number: 3,
)

Recruitment.create!(
  user_id: 1,
  category: 1,
  title: 'ベイスターズ',
  body: '横浜優勝＼(^o^)／',
  area: 16,
  address: '東京都渋谷区神宮2-12-22',
  recruitments_number: 3,
)

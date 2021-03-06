# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "test@test.com",
  password: "000000",
  first_name: "池田",
  last_name: "翔稀",
  first_name_kana: "イケダ",
  last_name_kana: "ショウキ",
  account_name: "いけちゃん",
  user_introduction: "よろしくお願いします！",
)

Task.create!(
  name: "テスト用タスク"
)
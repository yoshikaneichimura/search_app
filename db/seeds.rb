# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seedの実行を開始"

hanako = User.find_or_create_by!(email: "hanako.hakurai@example.com") do |user|
  user.password = "password"
  user.name = "桜井花子"
  user.introduction = "1965年生まれ 京都出身、代表作「紫陽花の亡骸」「NIGHT FLOWER」などがあります、宜しくね。"
end

sora = User.find_or_create_by!(email: "amano.sora@example.com") do |user|
  user.password = "password"
  user.name = "天野宇宙"
  user.introduction = "1968年生まれ岐阜出身、高校卒業後、青井美月に師事し2000年には黒岩学賞を受賞しました。"
end

ayaka = User.find_or_create_by!(email: "ayaka.ishiki@example.com") do |user|
  user.password = "password"
  user.name = "一色彩華"
  user.introduction = "1970年生まれ、東京出身　大学卒業後、広告代理店を得て写真家に転身"
end

hanako.posts.find_or_create_by!(
  title: "「椿の森」",
  body: "落ちても尚美しき咲き誇る様、こんな風に生きたいと私は思った。",
  price: "2530",
  day: "1982/10/17",
  status: "false"
)

hanako.posts.find_or_create_by!(
  title: "天叢雲剣",
  body: "雨上がる紫陽花が彩る山の中、この山には美しい糸を張り巡らせる芸術家達がいる",
  price: "3330",
  day: "1995/6/15",
  status: "true"
)

sora.posts.find_or_create_by!(
  title: "マジックアワー",
  body: "陽が落ちて行く30分だけ訪れる奇跡の時間、私達はこの星の空の美しさを知る",
  price: "3560",
  day: "2022/11/11",
  status: "true"
)

sora.posts.find_or_create_by!(
  title: "天体観測",
  body: "都心から遥か南、、、ここには星が見える島がある",
  price: "2660",
  day: "2000/8/8",
  status: "true"
)

ayaka.posts.find_or_create_by!(
  title: "BLUE HEAVEN",
  body: "閉館15分前の水族館、私達は蒼に光に誘われて魚が泳ぐ夢を見る、、、",
  price: "2570",
  day: "1982/5/17",
  status: "false"
)

ayaka.posts.find_or_create_by!(
  title: "R.E.D",
  body: "警報器、信号機、遮断機、、、赫い光は私達に何を示しているのだろうか？",
  price: "3670",
  day: "2025/10/17",
  status: "true"
)

puts "seedsの実行が完了しました。"

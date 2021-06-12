# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "golira@example.com",
    password: "golira"
)
# テストのために以下記述

Genre.create!(
   name: "ケーキ",
)

Genre.create!(
   name: "クッキー",
)

Genre.create!(
   name: "チョコレート",
)

Genre.create!(
   name: "アイスクリーム",
)

Genre.create!(
   name: "タルト",
)
Item.create!(
    product: "チョコレートケーキ",
    genre_id: 1,
    product_explain: "チョコレートケーキチョコレートケーキチョコレートケーキチョコレートケーキチョコレートケーキチョコレートケーキ",
    price: 5500,
    image: open("./app/assets/images/images (1).jpg")
   )

Item.create!(
    product: "ショートケーキ",
    genre_id: 1,
    product_explain: "ショートケーキショートケーキショートケーキショートケーキショートケーキショートケーキ",
    price: 4600,
    image: open("./app/assets/images/images.jpg")
   )


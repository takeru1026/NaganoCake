# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "samurai@samurai.com",
    password: "samurai"
)
genre = Genre.create!(
    name: "Cake"
    )
Item.create!(
    [
      {
        genre_id: genre.id,
        product: "ショートケーキ",
        image_id: "images.jpg",
        price: 4000,
        is_selling: true,
        product_explain: "季節限定のケーキです"
        },
        {
        genre_id: genre.id,
        product: "チョコレートケーキ",
        image_id: "images(1).jpg",
        price: 5000,
        is_selling: true,
        product_explain: "chacorateのケーキです"
      }
    ]
)


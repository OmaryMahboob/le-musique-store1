require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
User.destroy_all

User.create(
  first_name: "mahboob",
  last_name: "omary",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  admin: true,
  email: "mahboob@gmail.com",
  password: "123456"
)

User.create(
  first_name: "Jane",
  last_name: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  admin: true,
  email: "martins@test.com",
  password: "123456"
)

User.create(
  first_name: "Roger",
  last_name: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  admin: true,
  email: "roger.silva@live.cl",
  password: "123456"
)

instruments = ["Piano", "Ukelele", "Guitar", "Drum"]
photos = ["https://images.unsplash.com/photo-1479118013749-9f79d55a28d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
          "https://res.cloudinary.com/dslxaeaab/image/upload/v1678707512/Hcf278859cd3144c5b832902b581208c9k_ccilcl.png",
          "https://res.cloudinary.com/dslxaeaab/image/upload/v1678707512/Hcf278859cd3144c5b832902b581208c9k_ccilcl.png",
          "https://images.unsplash.com/photo-1602939444907-6e688c594a66"]

4.times do |i|
  actual_user = User.all.sample
  product = Product.new(
    title: instruments[i],
    description: Faker::Quote.jack_handey,
    price: rand(1..50),
    user: actual_user,
    address: actual_user.address
  )
  file = URI.open(photos[i])
  product.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  product.save
  p Product.last
end

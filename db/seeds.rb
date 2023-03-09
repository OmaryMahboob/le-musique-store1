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

User.create(first_name: "mahboob", last_name: "omary", phone: "098876544", address: "kabul", admin: true, email: "mahboob@gmail.com", password: "123456")

10.times do
  Product.create(
    title: Faker::Name.name,
    description: Faker::Quote.jack_handey,
    price: rand(1..50),
    user: User.all.sample,
    address: Faker::Address.full_address
  )
  p Product.last
end

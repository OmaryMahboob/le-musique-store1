require "faker"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
User.destroy_all

mahboob = User.create(
  first_name: "mahboob",
  last_name: "omary",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  email: "mahboob@gmail.com",
  password: "123456"
)

mahboob_product = Product.create!(
  title: "Rubab",
  description: "Afghanistan's national instrument, good sound",
  price: rand(20..100),
  user: mahboob,
  address: mahboob.address
)

mahboob_product.photos.attach(
  io: URI.open("https://dailymusicroll.s3.us-west-2.amazonaws.com/wp-content/uploads/2022/04/21160802/5499313034_11ba8fdcf8_b.jpg"),
  filename: "photo_rubab1.jpeg",
  content_type: "image/jpg"
)
mahboob_product.photos.attach(
  io: URI.open("https://i.guim.co.uk/img/media/bdc6551c0615762ef8e523dedfbe72a0daacc722/0_197_1791_1075/master/1791.jpg?width=1200&quality=85&auto=format&fit=max&s=1f7e5f7a7df79bf5936284cc52d2da18"),
  filename: "photo_rubab2.jpeg",
  content_type: "image/jpg"
)
mahboob_product.photos.attach(
  io: URI.open("https://i.ytimg.com/vi/RCabnDJ8Tgc/maxresdefault.jpg"),
  filename: "photo_rubab3.jpeg",
  content_type: "image/jpg"
)

User.create(
  first_name: "Jane",
  last_name: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "123456"
)

roger = User.create(
  first_name: "Roger",
  last_name: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "123456"
)
roger_product = Product.create!(
  title: "Charango",
  description: "Excellent condition charango, crafted from high-quality wood with warm, authentic tones.
                Perfect for all levels of musicians. Don't miss out on this beautiful, traditional Andean instrument.",
  price: rand(20..100),
  user: roger,
  address: roger.address
)
roger_product.photos.attach(
  io: URI.open("https://musiculum.de/wp-content/uploads/2021/02/Charango.jpg"),
  filename: "photo_charango1.jpeg",
  content_type: "image/jpg"
)

20.times do
  Geocoder.configure(api_key: ENV.fetch('MAPBOX_API_KEY'))
  sample_address = ["Friedrichstraße", "Potsdamer Platz", "Unter den Linden", "Kurfürstendamm", "Alexanderplatz",
                    "Karl-Marx-Straße", "Oranienburger Straße", "Kastanienallee", "Torstraße", "Simon-Dach-Straße",
                    "Schönhauser Allee", "Warschauer Straße", "Kottbusser Tor", "Sonnenallee", "Hermannstraße",
                    "Frankfurter Allee", "Neuköllnische Allee", "Mehringdamm", "Nollendorfplatz", "Bergmannstraße",
                    "Yorckstraße", "Oderberger Straße", "Graefestraße", "Reichenberger Straße", "Schlesische Straße",
                    "Kopenhagener Straße", "Boxhagener Straße", "Weserstraße", "Flughafenstraße", "Turmstraße"]
  street = sample_address.sample
  number = rand(1..70)
  full_address = "#{street} #{number}, Berlin"

  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: full_address,
    email: Faker::Internet.unique.email,
    password: "123456"
  )
end

instruments = ["guitar", "piano", "violin", "trumpet", "saxophone", "drums", "cello", "flute", "bass guitar", "ukulele",
               "clarinet", "harmonica", "accordion", "trombone", "banjo", "mandolin", "harmonium", "xylophone",
               "marimba", "didgeridoo", "bagpipes", "organ", "synthesizer", "harp", "oboe", "bassoon", "French horn",
               "electric guitar", "acoustic guitar", "steel drum", "conga drum", "timpani", "tabla", "dulcimer",
               "sitar", "kazoo", "bongos", "glockenspiel", "chimes", "vibraphone", "pan flute", "baglama", "oud",
               "djembe", "thumb piano", "pandeiro", "tambourine"]

25.times do
  actual_user = User.order("RANDOM()").first
  instrument = instruments.sample

  Product.create!(
    title: instrument.capitalize,
    description: "Lease a high-quality #{instrument} from us today and start playing your favorite tunes! Our
                  instruments are professionally maintained and ready to use. Whether you're a beginner or an
                  experienced player, our #{instrument}s are perfect for all skill levels.",
    price: rand(20..100),
    user: actual_user,
    address: actual_user.address
  )
end

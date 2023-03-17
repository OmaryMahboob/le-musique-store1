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
  email: "mahboob@gmail.com",
  password: "123456"
)

User.create(
  first_name: "Jane",
  last_name: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "123456"
)

User.create(
  first_name: "Roger",
  last_name: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "123456"
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
  uploaded_image = Cloudinary::Uploader.upload("https://res.cloudinary.com/dvrfyi1tt/image/upload/v1677664082/samples/people/jazz.jpg")


  Product.create!(
    title: instrument.capitalize,
    description: "Lease a high-quality #{instrument} from us today and start playing your favorite tunes! Our
                  instruments are professionally maintained and ready to use. Whether you're a beginner or an
                  experienced player, our #{instrument}s are perfect for all skill levels.",
    price: rand(20..100),
    photo: uploaded_image['url'].to_sym,
    user: actual_user,
    address: actual_user.address
  )
end

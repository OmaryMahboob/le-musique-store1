require "faker"
require "open-uri"

mahboob = User.create!(
  first_name: "mahboob",
  last_name: "omary",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  email: "mahboob@gmail.com",
  password: "123456"
)

mahboob.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667037206/tri21is6dulhoce0cocq.jpg"),
  filename: "profile_picture_mahboob.jpeg",
  content_type: "image/jpg"
)
mahboob.save

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

jane = User.create(
  first_name: "Jane",
  last_name: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "123456"
)

jane.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667074864/tkaswximthoisj8cucbd.jpg"),
  filename: "profile_picture_jane.jpeg",
  content_type: "image/jpg"
)
jane.save

roger = User.create(
  first_name: "Roger",
  last_name: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "123456"
)

roger.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1678216566/dp1l8wttyzcs2ynmpbqf.jpg"),
  filename: "profile_picture_roger.jpeg",
  content_type: "image/jpg"
)
roger.save

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

first_names = ["Avery", "Blake", "Cameron", "Charlie", "Dakota", "Drew", "Eliot", "Emerson", "Frankie", "Harley",
               "Hayden", "Hunter", "Jamie", "Jesse", "Jordan", "Jules", "Kai", "Kelly", "Kendall", "Lee", "Logan",
               "Max", "Morgan", "Noah", "Parker", "Phoenix", "Quinn", "Reagan", "Reese", "River", "Robin", "Rowan",
               "Sage", "Sam", "Sawyer", "Shawn", "Sidney", "Skyler", "Spencer", "Stevie", "Tanner", "Tatum",
               "Taylor", "Tristan", "Tyler", "Vivian", "Wesley", "Zion"]

sample_address = ["Friedrichstraße", "Potsdamer Platz", "Unter den Linden", "Kurfürstendamm", "Alexanderplatz",
                  "Karl-Marx-Straße", "Oranienburger Straße", "Kastanienallee", "Torstraße", "Simon-Dach-Straße",
                  "Schönhauser Allee", "Warschauer Straße", "Kottbusser Tor", "Sonnenallee", "Hermannstraße",
                  "Frankfurter Allee", "Neuköllnische Allee", "Mehringdamm", "Nollendorfplatz", "Bergmannstraße",
                  "Yorckstraße", "Oderberger Straße", "Graefestraße", "Reichenberger Straße", "Schlesische Straße",
                  "Kopenhagener Straße", "Boxhagener Straße", "Weserstraße", "Flughafenstraße", "Turmstraße"]
street = sample_address.sample
number = rand(1..70)
full_address = "#{street} #{number}, Berlin"

30.times do
  new_user = User.create(
    first_name: first_names.sample,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: full_address,
    email: Faker::Internet.unique.email,
    password: "123456"
  )
  new_user.profile_picture.attach(
    io: URI.open("https://kitt.lewagon.com/placeholder/users/random"),
    filename: "profile_picture_#{new_user.first_name}.jpeg",
    content_type: "image/jpg"
  )
  new_user.save
end

instruments = ["guitar", "piano", "violin", "trumpet", "saxophone", "drums", "cello", "flute", "bass guitar", "ukulele",
               "clarinet", "harmonica", "accordion", "trombone", "banjo", "mandolin", "harmonium", "xylophone",
               "marimba", "didgeridoo", "bagpipes", "organ", "synthesizer", "harp", "oboe", "bassoon", "French horn",
               "electric guitar", "acoustic guitar", "steel drum", "conga drum", "timpani", "tabla", "dulcimer",
               "sitar", "kazoo", "bongos", "glockenspiel", "chimes", "vibraphone", "pan flute", "baglama", "oud",
               "djembe", "thumb piano", "pandeiro", "tambourine"]

35.times do
  actual_user = User.order("RANDOM()").first
  instrument = instruments.sample

  Product.create!(
    title: instrument.capitalize,
    description: "Lease a high-quality #{instrument} today and start playing your favorite tunes! This #{instrument}
                  is super professional and I keep it ready for your use. Whether you're a beginner or an
                  experienced player, this #{instrument} is perfect for your level.",
    price: rand(20..80),
    user: actual_user,
    address: actual_user.address
  )
end

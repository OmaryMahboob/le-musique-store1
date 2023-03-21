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
  description: "The perfect rubab for lease is an instrument with a warm, resonant sound and a beautiful, polished
                finish. Its strings are responsive and easy to play, and its frets are well-spaced for comfortable
                finger placement. The rubab should be durable and well-maintained, with no scratches or dents. Ideally,
                it should come with a high-quality carrying case for easy transport and protection.",
  price: rand(2.0..20.0).round(2),
  user: mahboob,
  address: mahboob.address
)

mahboob_product.photos.attach(
  io: URI.open("https://dailymusicroll.s3.us-west-2.amazonaws.com/wp-content/uploads/2022/04/21160802/5499313034_11ba8fdcf8_b.jpg"),
  filename: "photo_rubab1.jpeg",
  content_type: "image/jpg"
)
mahboob.save

mahboob_product.photos.attach(
  io: URI.open("https://i.guim.co.uk/img/media/bdc6551c0615762ef8e523dedfbe72a0daacc722/0_197_1791_1075/master/1791.jpg?width=1200&quality=85&auto=format&fit=max&s=1f7e5f7a7df79bf5936284cc52d2da18"),
  filename: "photo_rubab2.jpeg",
  content_type: "image/jpg"
)
mahboob.save

mahboob_product.photos.attach(
  io: URI.open("https://i.ytimg.com/vi/RCabnDJ8Tgc/maxresdefault.jpg"),
  filename: "photo_rubab3.jpeg",
  content_type: "image/jpg"
)
mahboob.save

jane = User.create(
  first_name: "Jane",
  last_name: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "123456"
)

jane_product = Product.create!(
  title: "Marimba",
  description: "Looking for a marimba for lease? Look no further than our perfect instrument! My marimba is made of
                high-quality rosewood, with a beautiful warm and resonant tone. It has a full 5-octave range and a
                sturdy frame with durable wheels for easy transport. Renting my marimba comes with a custom fitted
                cover to protect the instrument. It's the perfect choice for both beginner and advanced percussionists.
                Contact me today to reserve your marimba!",
  price: rand(2.0..20.0).round(2),
  user: jane,
  address: jane.address
)

jane_product.photos.attach(
  io: URI.open("https://www.musicalortiz.com/wp-content/uploads/2021/11/Marimba.jpg"),
  filename: "photo_marimba.jpeg",
  content_type: "image/jpg"
)
jane.save

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
  description: "Looking for a high-quality charango for your next recording or performance? Look no further! My charango
  features traditional construction and materials, including a carved wooden body and nylon strings, producing a clear
  and vibrant sound. With its compact size and lightweight design, this charango is perfect for travel and easy to play,
  making it an excellent choice for musicians of all levels. Contact me today to book it!",
  price: rand(2.0..20.0).round(2),
  user: roger,
  address: roger.address
)
roger_product.photos.attach(
  io: URI.open("https://musiculum.de/wp-content/uploads/2021/02/Charango.jpg"),
  filename: "photo_charango1.jpeg",
  content_type: "image/jpg"
)
roger.save

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

30.times do
  street = sample_address.sample
  number = rand(1..70)
  full_address = "#{street} #{number}, Berlin"

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
  p new_user.first_name
end

instruments = ["guitar", "piano", "violin", "trumpet", "saxophone", "drums", "cello", "flute", "bass guitar", "ukulele",
               "clarinet", "harmonica", "accordion", "trombone", "banjo", "mandolin", "harmonium", "xylophone",
               "marimba", "didgeridoo", "bagpipes", "organ", "synthesizer", "harp", "oboe", "bassoon", "French horn",
               "electric guitar", "acoustic guitar", "steel drum", "conga drum", "timpani", "tabla", "dulcimer",
               "sitar", "kazoo", "bongos", "glockenspiel", "chimes", "vibraphone", "pan flute", "baglama", "oud",
               "djembe", "thumb piano", "pandeiro", "tambourine"]

instrument_images =
["https://m.media-amazon.com/images/I/51N2zTP-LqL._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/91CS0eGcsXL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71p3Ts9D6JL._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/81oRpoLLvYL._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/61cbqPP8P-L._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/71zGEA8lL4L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/61KqTV+V7IL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71V9djmrrNL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/61pNQNpgC1L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/61quGhuk1tL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/710O-XQN7ZL._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/81Xb++aTnPL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81f5B2cnJkL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/61NqSqEIgTL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81Ihfs5LTCL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71z3WEWEMLL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71Yx4zg7o+L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/711+cXsrKTL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/815mHicG39L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81gr9+IPivL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/61e6GcvDk9L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/61cyIX8JSwL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/717qmGlA7ZL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81Xb++aTnPL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71us2RZxgnL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/51vYRaJxxmL._AC_.jpg",
"https://m.media-amazon.com/images/I/71ZOQVzDjEL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71gV69XL34L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81Ihfs5LTCL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/819WldTQU8S._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/614THlKS2RL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/51WLd4L7nxL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/51uzv21J8XL._AC_.jpg",
"https://m.media-amazon.com/images/I/41MQV30G26L._AC_.jpg",
"https://m.media-amazon.com/images/I/71PdY8+X-AL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/51qoe5x-IlL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81qddT9HsnL._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/81x18tRmGlL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/41jbJJZ56BL._AC_.jpg",
"https://m.media-amazon.com/images/I/51KdNjiqy8L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81hpF2tyj5L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71Ust+3JFVL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71CQjIaXEQL._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/81E-oqRzzwL._AC_SY879_.jpg",
"https://m.media-amazon.com/images/I/61R6K+TVJ1L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71ehq28SC8L._AC_SX679_.jpg",
"https://m.media-amazon.com/images/I/71KnfDnTvQL._AC_SX679_.jpg"]

39.times do
  actual_user = User.order("RANDOM()").first
  instrument = instruments.shift
  instrument_image = instrument_images.shift

  new_instrument = Product.create!(
    title: instrument.capitalize,
    description: "Lease a high-quality #{instrument} today and start playing your favorite tunes! This #{instrument}
                  is super professional and I keep it ready for your use. Whether you're a beginner or an
                  experienced player, this #{instrument} is perfect for your level.",
    price: rand(2.0..20.0).round(2),
    user: actual_user,
    address: actual_user.address,
    photo: instrument_image
  )
  new_instrument.save
  p new_instrument
end

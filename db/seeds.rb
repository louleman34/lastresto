# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Buyer.destroy_all
Seller.destroy_all
Category.destroy_all
Offer.destroy_all
Reservation.destroy_all
Preference.destroy_all

puts "creating Buyers"
louis = Buyer.create!(
    email: 'louis@holdies.com',
    pseudo: 'louis34',
    password: 'aaaaaa',
    first_name: 'louis',
    last_name: 'delon',
    phone: "0620225589",
    )

olivier = Buyer.create!(
    email: 'louleman34@gmail.com',
    pseudo: 'olivier34',
    password: 'aaaaaa',
    first_name: 'Olivier',
    last_name: 'Leblond',
    phone: "0620225589" ,
    )

sophie = Buyer.create!(
    email: 'sophie@gmail.com',
    pseudo: 'Sophie34',
    password: 'aaaaaa',
    first_name: 'Sophie',
    last_name: 'latin',
    phone: "0620225589" ,
    )

martin = Buyer.create!(
    email: 'martin@gmail.com',
    pseudo: 'martin34',
    password: 'aaaaaa',
    first_name: 'Martin',
    last_name: 'darmagnon',
    phone: "0620225589",
    )

5.times do
  Buyer.create!(
    email: Faker::Internet.email,
    pseudo: Faker::Simpsons.character,
    password: 'aaaaaa',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::Config.locale = 'en-US'
    )
end

puts "creating Sellers"
resto1 = Seller.create!(
    email: 'resto1@lyonresto.com',
    name: 'Brasserie Georges',
    password: 'aaaaaa',
    address: '30 Cours de Verdun Perrache',
    zip_code: '69007',
    city: 'Lyon',
    phone_number: "0620225545",
  )

resto2 = Seller.create!(
    email: 'resto2@lyonresto.com',
    name: 'Tetedoie',
    password: 'aaaaaa',
    address: '4 Rue Professeur Pierre Marion',
    zip_code:'69007',
    city: 'Lyon',
    phone_number: "0620225585" ,
  )

resto3 = Seller.create!(
    email: 'resto3@lyonresto.com',
    name: 'Les terrasses de Lyon',
    password: 'aaaaaa',
    address: '25 Montée Saint-Barthélémy',
    zip_code: '69007',
    city: 'Lyon',
    phone_number: "0620225563",
  )

resto4 = Seller.create!(
    email: 'resto4@lyonresto.com',
    name: 'Le neuvième art',
    password: 'aaaaaa',
    address: '173 Rue Cuvier',
    zip_code: '69007',
    city: 'Lyon',
    phone_number: "0620225500",
  )


puts "creating categories"
category1 = Category.create!(
    name: 'Gastronomique'
    )
category2 = Category.create!(
    name: 'Japonais'
    )
category3 = Category.create!(
    name: 'Libanais'
    )
category4 = Category.create!(
    name: 'Pizzeria'
    )
category5 = Category.create!(
    name: 'Indien'
    )
category6 = Category.create!(
    name: 'FastFood'
    )



puts "creating offers"
offer1 = Offer.create!(
    title: " Remise sur le menu enfant de -30%",
    seller_id: resto1.id,
    category_id: category1.id,
    date: Faker::Date.forward(7),
    price: "25 euros",
    duration: "toute reservation prise avant 21h30",
    description: "tous nos plats sont fait maison",
    file: "",
    quantity: "5"
  )
offer2 = Offer.create!(
    title: "Offre spéciale: toute la carte à -50%",
    seller_id: resto2.id,
    category_id: category4.id,
    date: Faker::Date.forward(7),
    price: "25 euros",
    duration: "entre 21h30 et 23h30",
    description: "tous nos plats sont fait maison",
    file: "",
    quantity: "5"

  )

offer3 = Offer.create!(
    title: "Remise immédiate sur tous lfruits de mer de -20%",
    seller_id: resto3.id,
    category_id: category2.id,
    date: Faker::Date.forward(7),
    price: "25 euros",
    duration: "toute reservation prise avant 20h30",
    description: "tous nos plats sont fait maison",
    file: "",
    quantity: "5"
  )

offer4 = Offer.create!(
    title: "Remise immédiate sur le menu degustation de -20%",
    seller_id: resto4.id,
    category_id: category3.id,
    date: Faker::Date.forward(7),
    price: "25 euros",
    duration: "happy hour avant 20h00",
    description: "tous nos produits sont frais",
    file: "",
    quantity: "5"
  )

offer5 = Offer.create!(
    title: "Remise immédiate sur le menu degustation de -20%",
    seller_id: resto4.id,
    category_id: category3.id,
    date: Faker::Date.forward(7),
    price: "30 euros",
    duration: "-20 sur tout le restaurant",
    description: "tous nos produits sont frais",
    file: "",
    quantity: "5"
  )


puts "creating reservations"
reservation1 = Reservation.create!(
    comment: 'bonjour nous arriverons vers 20h',
    date: Date.today,
    buyer_id: louis.id,
    seller_id: resto1.id,
    offer_id: offer2.id
    )

reservation2 = Reservation.create!(
    comment: 'nous sommes 4',
    date: Date.today,
    buyer_id: olivier.id,
    seller_id: resto2.id,
    offer_id: offer1.id
    )

reservation3 = Reservation.create!(
    comment: 'bonjour nous arriverons vers 20h',
    date: Date.today,
    buyer_id: louis.id,
    seller_id: resto3.id,
    offer_id: offer3.id
    )

reservation4 = Reservation.create!(
    comment: 'bonjour nous arriverons vers 20h',
    date: Date.today,
    buyer_id: sophie.id,
    seller_id: resto4.id,
    offer_id: offer4.id
    )
#
  25.times do
  Reservation.create!(
    comment: Faker::Dune.saying,
    date: Date.today,
    buyer_id: ((Buyer.first.id)..(Buyer.last.id)).to_a.sample,
    seller_id: ((Seller.first.id)..(Seller.last.id)).to_a.sample,
    offer_id:((Offer.first.id)..(Offer.last.id)).to_a.sample,
  )
end

puts "creating preferences"
preference1 = Preference.create!(
    category_id: category1.id,
    buyer_id: louis.id,
  )
preference2 = Preference.create!(
    category_id: category2.id,
    buyer_id: louis.id,
  )

preference3 = Preference.create!(
    category_id: category3.id,
    buyer_id: olivier.id,
  )

preference4 = Preference.create!(
    category_id: category4.id,
    buyer_id: sophie.id,
  )

preference5 = Preference.create!(
    category_id: category5.id,
    buyer_id: martin.id,
  )

preference6 = Preference.create!(
    category_id: category6.id,
    buyer_id: martin.id,
  )

# 60.times do
#   Post.create!(
#     content: Faker::Lovecraft.paragraphs,
#     private: false,
#     published: false,
#     user_id: ((User.first.id)..(User.last.id)).to_a.sample,
#     theme_id: ((Theme.first.id)..(Theme.last.id)).to_a.sample,
#     category_id: ((Category.first.id)..(Category.last.id)).to_a.sample
#   )
# end

puts "successful CONGRATULATIONS !!!!"

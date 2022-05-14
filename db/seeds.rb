# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Cleaning up database..."
User.destroy_all
Apartment.destroy_all
puts "Database cleaned"

apartment_descriptions = [
  "Sunny apartment in Kreuzberg with balcony!",
  "Quaint 1 room apartment near the canal",
  "Penthouse apartment overlooking beautiful Hermannplatz "
]

apartment_area = ["Neukolln", "Kreuzberg", "Mitte"]

apartment_rent = [300, 400, 500]

apartment_title = ["Sunny apartment in Berlin", "Altbau", "Neubau", "Apartment"]

apartment_room = [3, 5, 2, 1]

puts 'creating apartments'

user = User.new(
  email: "email@email.com",
  password: "123456"
)
user.save!

apartment1 = Apartment.new(
  description: apartment_descriptions.sample,
  user_id: user.id,
  area: apartment_area.sample,
  rent: apartment_rent.sample,
  title: apartment_title.sample,
  room: apartment_room.sample
)

file = URI.open("https://images.unsplash.com/photo-1550609531-57c783bb03e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80")

apartment1.photos.attach(io: file, filename: file, content_type: "image/jpg")
apartment1.photos.attach(io: file2, filename: file2, content_type: "image/jpg")
apartment1.save!

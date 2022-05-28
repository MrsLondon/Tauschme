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
Filter.destroy_all
User.destroy_all
Apartment.destroy_all
puts "Database cleaned"

apartment_descriptions = [
  "Sunny apartment in Kreuzberg with balcony!",
  "Quaint 1 room apartment near the canal",
  "Penthouse apartment overlooking beautiful Hermannplatz",
  "Bright rooms, big kitchen, grass in the backyard",
  "You'll love eating burgers in this stunning apartment"
]

apartment_area = ["Neukolln", "Kreuzberg", "Mitte", "Wedding", "Pankow"]

apartment_rent = [300, 400, 500, 100, 1000]

apartment_title = ["Sunny apartment in Berlin", "Altbau", "Neubau", "Groovy Apartment", "Your new home", "Make me your new home", "My wife left me, please exchange!!", "No more kids at home, need to downsize", "My dog needs a backyar"]

apartment_room = [3, 5, 2, 1, 10]

file = URI.open("https://images.unsplash.com/photo-1550609531-57c783bb03e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")

  puts 'creating users'
  user = User.new(
    email: "email@email.com",
    password: "123456"
  )
  user.save!

  user_two = User.new(
    email: "usertwo@email.com",
    password: "123456"
  )
  user_two.save!

  5.times do
  puts 'creating apartments'
  apartment = Apartment.new(
    description: apartment_descriptions.sample,
    area: apartment_area.sample,
    rent: apartment_rent.sample,
    title: apartment_title.sample,
    room: apartment_room.sample
  )

  apartment.user = User.all.sample
  apartment.save!
  end
  Apartment.last.photos.attach(io: file, filename: file, content_type: "image/jpg")

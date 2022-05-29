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

aprtments = [
  {
  title: "Sunny apartment in Berlin",
  area: "kreuzberg",
  rent: 700,
  room: 2,
  img_file_names: ['apartment1.jpeg'],
  user_one: {
    email: 'emma@gmail.com',
    password: '123456'
  }
  },
  {
  title: "Quaint 1 room apartment near the canal",
  area: "Wedding",
  rent: 400,
  room: 1,
  img_file_names: ['apartment2.jpeg'],
  user_one: {
    email: 'malik@gmail.com',
    password: '123456'
  }
  },
  {
  title: "Penthouse apartment overlooking beautiful Hermannplatz",
  area: "Pankow",
  rent: 800,
  room: 2,
  img_file_names: ['apartment3.jpeg'],
  user_one: {
    email: 'jason@gmail.com',
    password: '123456'
  }
  },
  {
    title: "Sunny apartment in Berlin",
    area: "mitte",
    rent: 900,
    room: 2,
    img_file_names: ['apartment5.webp'],
    user_one: {
      email: 'sam@gmail.com',
      password: '123456'
    }
    },
  {
  title: "Bright rooms, big kitchen, grass in the backyard",
  area: "Prenzlauerberg",
  rent: 3000,
  room: 5,
  img_file_names: ['apartment4.jpeg'],
  user_one: {
    email: 'jack@gmail.com',
    password: '123456'
  }
  }
]

apartments.each_with_index do |apartment, index|
  puts "seed user & apartment (#{index + 1}/#{apartments.length})"
  puts 'Creating user'
  seed_user = User.new(
    email: apartment[:user_one][:email],
    password: apartment[:user_one][:password]
  )
  seed_user.save!
end

  puts 'creating apartments'
  seed_apartment = apartment.new(
    title: apartment[:title],
    area: apartment[:area],
    rent: apartment[:rent],
    room: apartment[:room]
  )

  puts 'associating apartment and image'
  apartment[:img_file_names].each do |img_file|
    seed_apartment.photos.attach(io: File.open("app/assets/images/#{img_file}"), content_type: 'image/jpg')
  end

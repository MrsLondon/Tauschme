# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

# puts "Cleaning up database..."
Filter.destroy_all
Status.destroy_all
Message.destroy_all
User.destroy_all
Apartment.destroy_all

# puts "Database cleaned"

apartments = [
  #Kreuzberg apartments for demo
  {
  title: "Large 8 room apartment fit for a big family",
  area: "Kreuzberg",
  rent: 450,
  room: 8,
  img_file_names: ['apartment1.png', 'apartment1.1.jpeg', 'apartment1.2.jpeg', 'apartment1.3.jpeg'],
    user_one: {
    email: 'ayat@gmail.com',
    password: '123456'
    }
  },
  {
  title: "I've lived here for 13 years without a rent increase. Tausch with me please!!!!",
  area: "Kreuzberg",
  rent: 340,
  room: 5,
  img_file_names: ['apartment2.jpeg', 'apartment2.2.jpeg', 'apartment2.3.jpeg'],
    user_one: {
    email: 'coffeeluva@gmail.com',
    password: '123456'
    }
  },
  {
  title: "This place honestly gets 0 dust. ZERO. It's amazing, you never have to clean. Ground floor, no windows.",
  area: "Kreuzberg",
  rent: 230,
  room: 4,
  img_file_names: ['apartment3.jpeg', 'apartment3.1.jpeg', 'apartment3.2.jpeg', 'apartment3.3.jpeg','apartment3.4.jpeg' ,'apartment3.5.jpeg', 'apartment3.6.jpeg'],
    user_one: {
    email: 'dude@gmail.com',
    password: '123456'
    }
  },
  {
  title: "Quiet neighbours. Babies not allowed... soz.",
  area: "Kreuzberg",
  rent: 421,
  room: 4,
  img_file_names: ['apartment4.jpeg', 'apartment4.1.jpeg', 'apartment4.2.jpeg', 'apartment4.3.jpeg', 'apartment4.5.jpeg', 'apartment4.6.jpeg', 'apartment4.7.jpeg'],
    user_one: {
    email: 'sorrynotsorry@gmail.com',
    password: '123456'
    }
  },
  {
    title: "Just got dumped, need a new place. Help a girl out... bitte.",
    area: "Kreuzberg",
    rent: 230,
    room: 4,
    img_file_names: ['apartment5.jpeg', 'apartment5.1.jpeg', 'apartment5.2.jpeg', 'apartment5.3.jpeg', 'apartment5.4.jpeg'],
      user_one: {
      email: 'justgotdumped@gmail.com',
      password: '123456'
      }
    },
  {
    title: "Sunny apartment in Berlin",
    area: "Kreuzberg",
    rent: 280,
    room: 15,
    img_file_names: ['apartment6.1.jpeg', 'apartment6.2.jpeg', 'apartment6.3.jpeg'],
      user_one: {
      email: 'emma@gmail.com',
      password: '123456'
      }
    },
    {
    title: "Dark 3 room ground floor apartment near the canal",
    area: "Kreuzberg",
    rent: 400,
    room: 8,
    img_file_names: ['apartment7.jpeg', 'apartment7.1.jpeg', 'apartment7.3.jpeg'],
      user_one: {
      email: 'malik@gmail.com',
      password: '123456'
      }
    },
    {
    title: "Penthouse apartment overlooking the beautiful and clean Gorlitzerpark",
    area: "Kreuzberg",
    rent: 333,
    room: 3,
    img_file_names: ['apartment8.jpeg', 'apartment8.1.jpeg', 'apartment8.2.jpeg'],
      user_one: {
      email: 'jason@gmail.com',
      password: '123456'
      }
    },
    {
      title: "Party palace above KitKat, you'll love it here... trust me",
      area: "Kreuzberg",
      rent: 450,
      room: 10,
      img_file_names: ['apartment9.jpeg'],
        user_one: {
        email: 'sam@gmail.com',
        password: '123456'
      }
      },
    {
    title: "Bright rooms, big kitchen, grass in the backyard",
    area: "Kreuzberg",
    rent: 500,
    room: 5,
    img_file_names: ['apartment10.jpeg', 'apartment10.1.jpeg', 'apartment10.2.jpeg'],
      user_one: {
      email: 'jack@gmail.com',
      password: '123456'
      }
    },

  #Mitte apartments (depending on demo type)
  {
  title: "Cosy studio flat, perfect for students",
  area: "Mitte",
  rent: 209,
  room: 1,
  img_file_names: ['apartment6.1.webp', 'apartment6.2.webp', 'apartment6.3.webp'],
  user_one: {
    email: 'dina@gmail.com',
    password: '123456'
  }
  },
  {
  title: "Bright apartment, perfect for couples",
  area: "Mitte",
  rent: 344,
  room: 1,
  img_file_names: ['apartment7.webp', 'apartment7.1.webp', 'apartment7.2.webp', 'apartment7.3.webp'],
  user_one: {
    email: 'mai@gmail.com',
    password: '123456'
  }
  },
  {
  title: "Modern apartment near Potsdamer Platz",
  area: "Mitte",
  rent: 212,
  room: 1,
  img_file_names: ['apartment8.webp', 'apartment8.1.webp', 'apartment8.3.webp', 'apartment8.2.webp', 'apartment8.4.webp', 'apartment8.5.webp', 'apartment8.6.webp', 'potsdamer.jpeg'],
  user_one: {
    email: 'roy@gmail.com',
    password: '123456'
  }
  },
  {
    title: "Ground floor apartment in Mitte",
    area: "Mitte",
    rent: 50,
    room: 1,
    img_file_names: ['apartment9.webp', 'apartment9.1.webp', 'apartment9.3.webp', 'apartment9.2.webp', 'apartment9.4.webp', 'apartment9.5.webp', 'apartment9.6.webp'],
    user_one: {
      email: 'alex@gmail.com',
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

  puts 'creating apartments'
  seed_apartment = Apartment.new(
    title: apartment[:title],
    area: apartment[:area],
    rent: apartment[:rent],
    room: apartment[:room]
  )
  seed_apartment.user = seed_user
  seed_apartment.save

  puts 'associating apartment and image'
  apartment[:img_file_names].each_with_index do |img_file, ind|
    seed_apartment.photos.attach(io: File.open("app/assets/images/#{img_file}"), content_type: 'image/jpg', filename: "#{seed_apartment.id}_#{ind}")
  end
end

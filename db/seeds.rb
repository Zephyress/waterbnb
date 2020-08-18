require 'faker'
CATEGORIES = ["Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]

puts " \u{26f5} Sinking the boats \u{26f5} "
puts
Boat.destroy_all
puts " \u{1f52a} Killing the users \u{1f52a} "
User.destroy_all
puts

puts " ------- \u{2728} !DB Clean! \u{2728} ------- "
puts
puts "\u{1f476} Giving birth to new users \u{1f476}"
20.times do
  User.create!(
    name:Faker::FunnyName.name,
    email:Faker::Internet.email,
    password:"pouetpouet")
  end
puts
puts "\u{1f46f} #{User.count} users \u{1f46f}"
puts
puts " \u{1f6e0}  Building new boats \u{1f6e0} "
20.times do
  Boat.create!(
    title:Faker::GreekPhilosophers.name,
    price:Faker::Number.within(range: 40..5000),
    category:CATEGORIES.sample,
    description: Faker::GreekPhilosophers.quote,
    user_id: User.all.sample.id)
  end
puts
puts "\u{2693} #{Boat.count} boats in the harbor \u{2693}"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

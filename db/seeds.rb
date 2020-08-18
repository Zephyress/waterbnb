require 'faker'
require 'open-uri'
require 'nokogiri'
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
puts "\u{1f46f} CONGRATS! It's #{User.count} users \u{1f46f}"
puts
puts " \u{1f6e0}  Building new boats \u{1f6e0} "

url = "https://www.yachtworld.com/boats-for-sale/type-sail/"

html_file = open(
  url,
  'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:79.0) Gecko/20100101 Firefox/79.0',
  'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
  ).read
html_doc = Nokogiri::HTML(html_file)
images = ['./app/assets/images/boat1.png','./app/assets/images/boat2.png','./app/assets/images/boat3.png','./app/assets/images/boat4.png','./app/assets/images/boat5.png','./app/assets/images/boat6.png','./app/assets/images/boat7.png','./app/assets/images/boat8.png','./app/assets/images/boat9.png']
# html_doc.search('img').each do |element|
#   # images << element.attribute('src').value
#   puts element
# end


20.times do
  boat = Boat.create!(
    title:Faker::GreekPhilosophers.name,
    price:Faker::Number.within(range: 40..5000),
    category:CATEGORIES.sample,
    description: Faker::GreekPhilosophers.quote,
    user_id: User.all.sample.id
  )
  file.open(images.sample)
  boat.photo.attach(io: file, filename: "${boat.title}.jpg", content_type: 'image/jpg')
end

puts "\u{2693} #{Boat.count} boats in the harbor \u{2693}"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



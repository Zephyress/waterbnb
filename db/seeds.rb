require 'faker'
require 'open-uri'
require 'nokogiri'
CATEGORIES = ["Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]

puts " \u{26f5} Sinking the existing boats \u{26f5} "
puts
Boat.destroy_all
puts " \u{1f52a} Killing the registered users \u{1f52a} "
User.destroy_all
puts

puts " ------- \u{2728} !DB Clean! \u{2728} ------- "
puts




# html_file = open(
#   url,
#   'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:79.0) Gecko/20100101 Firefox/79.0',
#   'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
#   ).read
# html_doc = Nokogiri::HTML(html_file

puts "\u{1f476} Giving birth to new users \u{1f476}"
10.times do
  user = User.create!(
    name:Faker::FunnyName.name,
    email:Faker::Internet.email,
    password:"pouetpouet")
  file = URI.open('https://www.fillmurray.com/640/360')
user.photo.attach(io: file, filename: 'Bill.jpg', content_type: 'image/jpg')
  end
puts
puts "\u{1f46f} CONGRATS! It's #{User.count} users, half of them (give or take) are girls \u{1f46f}"
puts
puts " \u{1f6e0}  Building new boats \u{1f6e0} "

images = ['./app/assets/images/boat1.png','./app/assets/images/boat8.png','./app/assets/images/boat9.png','./app/assets/images/boat2ndseed1.jpg','./app/assets/images/boat2ndseed2.jpg','./app/assets/images/boat2ndseed3.jpg','./app/assets/images/boat2ndseed4.jpg', './app/assets/images/boat2ndseed5.jpg','./app/assets/images/boat2ndseed6.jpg','./app/assets/images/boat2ndseed7.jpg','./app/assets/images/boat2ndseed8.jpg','./app/assets/images/boat2ndseed9.jpg', './app/assets/images/boat2ndseed10.jpg' ]
# html_doc.search('img').each do |element|
#   # images << element.attribute('src').value
#   puts element
# end


10.times do
  boat = Boat.create!(
    title:Faker::GreekPhilosophers.name,
    price:Faker::Number.within(range: 40..5000),
    category:CATEGORIES.sample,
    description: Faker::GreekPhilosophers.quote,
    user_id: User.all.sample.id
  )
  file = File.open(images.sample)
  boat.photo.attach(io: file, filename: "${boat.title}.jpg", content_type: 'image/jpg')
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



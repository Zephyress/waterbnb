class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  CATEGORIES = ["Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]
end

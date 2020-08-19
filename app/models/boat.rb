class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  CATEGORIES = ["Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]
end

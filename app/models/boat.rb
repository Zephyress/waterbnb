class Boat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  CATEGORIES = ["Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]
end

class Boat < ApplicationRecord
  belongs_to :user
  CATEGORIES = ["Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]
end

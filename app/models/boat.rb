class Boat < ApplicationRecord
  belongs_to :user
  CATEGORIES = ["Voilier", "Bateau à moteur", "Semi-rigide", "Catamaran", "Jet-ski", "Péniche", "Yatch"]
end

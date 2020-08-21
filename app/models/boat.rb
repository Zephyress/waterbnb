class Boat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

  CATEGORIES = ["", "Gulet", "Motoryatch", "Motor Boat", "Power catamaran", "Jet-ski", "Catamaran", "Sailing yatch"]
end
